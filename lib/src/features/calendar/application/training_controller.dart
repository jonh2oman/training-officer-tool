import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/training_session.dart';
import '../../lessons/domain/lesson.dart';
import 'training_storage.dart';

class TrainingState {
  final List<TrainingSession> sessions;
  final int academicYear;
  final int paradeWeekday; // 1 = Monday, 7 = Sunday
  final CadetElement selectedElement;
  final CalendarMode calendarMode;
  final bool isLoading;

  TrainingState({
    this.sessions = const [],
    this.academicYear = 2026,
    this.paradeWeekday = 2, // Default to Tuesday
    this.selectedElement = CadetElement.sea,
    this.calendarMode = CalendarMode.academic,
    this.isLoading = false,
  });

  TrainingState copyWith({
    List<TrainingSession>? sessions,
    int? academicYear,
    int? paradeWeekday,
    CadetElement? selectedElement,
    CalendarMode? calendarMode,
    bool? isLoading,
  }) {
    return TrainingState(
      sessions: sessions ?? this.sessions,
      academicYear: academicYear ?? this.academicYear,
      paradeWeekday: paradeWeekday ?? this.paradeWeekday,
      selectedElement: selectedElement ?? this.selectedElement,
      calendarMode: calendarMode ?? this.calendarMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class TrainingController extends StateNotifier<TrainingState> {
  TrainingController() : super(TrainingState()) {
    _loadAndInitialize();
  }

  Future<void> _loadAndInitialize() async {
    state = state.copyWith(isLoading: true);
    try {
      final savedSessions = await TrainingStorage.loadSessions();
      final savedElement = await TrainingStorage.loadElement();
      final savedMode = await TrainingStorage.loadCalendarMode();
      
      if (savedSessions != null && savedSessions.isNotEmpty) {
        final first = savedSessions.first;
        final year = first.date.month >= 9 ? first.date.year : first.date.year - 1;
        state = state.copyWith(
          sessions: savedSessions, 
          academicYear: year, 
          paradeWeekday: first.date.weekday,
          selectedElement: savedElement,
          calendarMode: savedMode,
          isLoading: false,
        );
      } else {
        _initializeYear(state.academicYear, state.paradeWeekday, savedMode);
        state = state.copyWith(selectedElement: savedElement, calendarMode: savedMode, isLoading: false);
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error loading saved sessions: $e');
      _initializeYear(state.academicYear, state.paradeWeekday, state.calendarMode);
      state = state.copyWith(isLoading: false);
    }
  }

  void _initializeYear(int startYear, int weekday, [CalendarMode? mode]) {
    final activeMode = mode ?? state.calendarMode;
    final DateTime startDate;
    final DateTime endDate;

    if (activeMode == CalendarMode.academic) {
      startDate = DateTime(startYear, 9, 1);
      endDate = DateTime(startYear + 1, 6, 30);
    } else {
      startDate = DateTime(startYear, 1, 1);
      endDate = DateTime(startYear, 12, 31);
    }

    final List<TrainingSession> sessions = [];
    DateTime current = startDate;

    while (current.isBefore(endDate.add(const Duration(days: 1)))) {
      if (current.weekday == weekday) {
        sessions.add(TrainingSession(date: current, type: SessionType.paradeNight));
      }
      current = current.add(const Duration(days: 1));
    }

    state = state.copyWith(
      sessions: sessions, 
      academicYear: startYear, 
      paradeWeekday: weekday,
      calendarMode: activeMode,
    );
    _save();
    TrainingStorage.saveCalendarMode(activeMode);
  }

  void setAcademicYear(int year) {
    _initializeYear(year, state.paradeWeekday);
  }

  void setParadeWeekday(int weekday) {
    _initializeYear(state.academicYear, weekday);
  }

  void setCalendarMode(CalendarMode mode) {
    _initializeYear(state.academicYear, state.paradeWeekday, mode);
  }

  void setElement(CadetElement element) {
    state = state.copyWith(selectedElement: element);
    TrainingStorage.saveElement(element);
  }

  void addAdHocSession(DateTime date, SessionType type) {
    state = state.copyWith(
      sessions: [...state.sessions, TrainingSession(date: date, type: type)]..sort((a, b) => a.date.compareTo(b.date)),
    );
    _save();
  }

  void updateSessionDetails(String sessionId, {String? dutyOfficer, String? dutyNCO, String? dress, String? announcements}) {
    state = state.copyWith(
      sessions: state.sessions.map((s) {
        if (s.id == sessionId) {
          return s.copyWith(
            dutyOfficer: dutyOfficer,
            dutyNCO: dutyNCO,
            dress: dress,
            announcements: announcements,
          );
        }
        return s;
      }).toList(),
    );
    _save();
  }

  void clearAllLessons() {
    final cleared = state.sessions.map((session) {
      final clearedMatrix = session.matrix.map((phase, slots) {
        return MapEntry(
          phase,
          slots.map((_) => const LessonSlot()).toList(),
        );
      });
      return session.copyWith(matrix: clearedMatrix);
    }).toList();
    state = state.copyWith(sessions: cleared);
    _save();
  }

  void batchAutoPlan() {
    var newSessions = List<TrainingSession>.from(state.sessions);
    final element = state.selectedElement;

    // Build a queue of remaining periods to plan, keyed by Phase.
    // Each entry is a lesson that needs one period slot filled.
    final Map<Phase, List<Lesson>> queues = {};

    for (var phase in Phase.values) {
      final mandatoryLessons = LessonLibrary.getLessonsForPhase(phase, element: element)
          .where((l) => l.isMandatory && l.category == 'Fundamental')
          .toList();

      final List<Lesson> queue = [];
      for (var lesson in mandatoryLessons) {
        int plannedCount = 0;
        for (var session in newSessions) {
          plannedCount += (session.matrix[phase] ?? []).where((s) => s.eoCode == lesson.code).length;
        }
        final remaining = lesson.periods - plannedCount;
        for (int i = 0; i < remaining; i++) {
          queue.add(lesson);
        }
      }
      if (queue.isNotEmpty) queues[phase] = queue;
    }

    if (queues.isEmpty) return;

    // Distribute by dealing one period per Phase per session (round-robin).
    // This ensures no single subject dominates consecutive nights.
    final phases = queues.keys.toList();
    int phaseIndex = 0; // which Phase we try to deal next

    for (int sIdx = 0; sIdx < newSessions.length; sIdx++) {
      // Check if any lessons remain at all
      if (queues.values.every((q) => q.isEmpty)) break;

      var session = newSessions[sIdx];
      var matrix = Map<Phase, List<LessonSlot>>.from(session.matrix);
      bool sessionModified = false;

      // Find empty slot count for this session
      int totalEmptySlots = 0;
      for (var phase in phases) {
        totalEmptySlots += (matrix[phase] ?? []).where((s) => s.isEmpty).length;
      }
      if (totalEmptySlots == 0) continue;

      // Deal one lesson from each phase into this session, rotating
      // through phases so we never place the same phase in back-to-back slots.
      int dealtThisSession = 0;
      int attempts = 0;
      final maxAttempts = phases.length * 2;

      while (dealtThisSession < totalEmptySlots && attempts < maxAttempts) {
        // Find next phase with remaining lessons
        Phase? targetPhase;
        for (int i = 0; i < phases.length; i++) {
          final candidate = phases[(phaseIndex + i) % phases.length];
          if ((queues[candidate]?.isNotEmpty ?? false)) {
            final slots = matrix[candidate] ?? [];
            if (slots.any((s) => s.isEmpty)) {
              targetPhase = candidate;
              phaseIndex = (phaseIndex + i + 1) % phases.length;
              break;
            }
          }
        }

        if (targetPhase == null) break;

        final queue = queues[targetPhase]!;
        final slots = List<LessonSlot>.from(matrix[targetPhase] ?? []);
        final emptyIdx = slots.indexWhere((s) => s.isEmpty);

        if (emptyIdx != -1 && queue.isNotEmpty) {
          final lesson = queue.removeAt(0);
          slots[emptyIdx] = LessonSlot(eoCode: lesson.code, title: lesson.title);
          matrix[targetPhase] = slots;
          sessionModified = true;
          dealtThisSession++;
        }

        attempts++;
      }

      if (sessionModified) {
        newSessions[sIdx] = session.copyWith(matrix: matrix);
      }
    }

    state = state.copyWith(sessions: newSessions);
    _save();
  }

  void moveSession(String sessionId, DateTime newDate) {
    state = state.copyWith(
      sessions: state.sessions.map((s) {
        if (s.id == sessionId) {
          return s.copyWith(date: newDate);
        }
        return s;
      }).toList()..sort((a, b) => a.date.compareTo(b.date)),
    );
    _save();
  }

  void assignLesson(String sessionId, Phase phase, int periodIndex, LessonSlot slot) {
    state = state.copyWith(
      sessions: state.sessions.map((s) {
        if (s.id == sessionId) {
          final newMatrix = Map<Phase, List<LessonSlot>>.from(s.matrix);
          final newList = List<LessonSlot>.from(newMatrix[phase]!);
          newList[periodIndex] = slot;
          newMatrix[phase] = newList;
          return s.copyWith(matrix: newMatrix);
        }
        return s;
      }).toList(),
    );
    _save();
  }

  Future<void> _save() async {
    await TrainingStorage.saveSessions(state.sessions);
  }
}

final trainingProvider = StateNotifierProvider<TrainingController, TrainingState>((ref) {
  return TrainingController();
});
