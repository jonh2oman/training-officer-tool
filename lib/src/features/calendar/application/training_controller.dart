import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/training_session.dart';
import 'training_storage.dart';

class TrainingState {
  final List<TrainingSession> sessions;
  final int academicYear;
  final int paradeWeekday; // 1 = Monday, 7 = Sunday
  final bool isLoading;

  TrainingState({
    this.sessions = const [],
    this.academicYear = 2026,
    this.paradeWeekday = 2, // Default to Tuesday
    this.isLoading = false,
  });

  TrainingState copyWith({
    List<TrainingSession>? sessions,
    int? academicYear,
    int? paradeWeekday,
    bool? isLoading,
  }) {
    return TrainingState(
      sessions: sessions ?? this.sessions,
      academicYear: academicYear ?? this.academicYear,
      paradeWeekday: paradeWeekday ?? this.paradeWeekday,
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
    final savedSessions = await TrainingStorage.loadSessions();
    
    if (savedSessions != null && savedSessions.isNotEmpty) {
      // Find the most recent year and weekday from saved sessions
      final first = savedSessions.first;
      final year = first.date.month >= 9 ? first.date.year : first.date.year - 1;
      state = state.copyWith(
        sessions: savedSessions, 
        academicYear: year, 
        paradeWeekday: first.date.weekday,
        isLoading: false,
      );
    } else {
      _initializeYear(state.academicYear, state.paradeWeekday);
      state = state.copyWith(isLoading: false);
    }
  }

  void _initializeYear(int startYear, int weekday) {
    final startDate = DateTime(startYear, 9, 1);
    final endDate = DateTime(startYear + 1, 6, 30);

    final List<TrainingSession> sessions = [];
    DateTime current = startDate;

    while (current.isBefore(endDate)) {
      if (current.weekday == weekday) {
        sessions.add(TrainingSession(date: current, type: SessionType.paradeNight));
      }
      current = current.add(const Duration(days: 1));
    }

    state = state.copyWith(sessions: sessions, academicYear: startYear, paradeWeekday: weekday);
    _save();
  }

  void setAcademicYear(int year) {
    _initializeYear(year, state.paradeWeekday);
  }

  void setParadeWeekday(int weekday) {
    _initializeYear(state.academicYear, weekday);
  }

  void addAdHocSession(DateTime date, SessionType type) {
    state = state.copyWith(
      sessions: [...state.sessions, TrainingSession(date: date, type: type)]..sort((a, b) => a.date.compareTo(b.date)),
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
