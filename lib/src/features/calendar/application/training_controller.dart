import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/training_session.dart';

class TrainingState {
  final List<TrainingSession> sessions;
  final bool isLoading;

  TrainingState({
    this.sessions = const [],
    this.isLoading = false,
  });

  TrainingState copyWith({
    List<TrainingSession>? sessions,
    bool? isLoading,
  }) {
    return TrainingState(
      sessions: sessions ?? this.sessions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class TrainingController extends StateNotifier<TrainingState> {
  TrainingController() : super(TrainingState()) {
    _initializeAcademicYear();
  }

  void _initializeAcademicYear() {
    // Basic logic to find all Tuesdays between Sep 1 and Jun 30
    final now = DateTime.now();
    final startYear = now.month >= 9 ? now.year : now.year - 1;
    final startDate = DateTime(startYear, 9, 1);
    final endDate = DateTime(startYear + 1, 6, 30);

    final List<TrainingSession> sessions = [];
    DateTime current = startDate;

    while (current.isBefore(endDate)) {
      // 2 is Tuesday (Mon=1, Tue=2, etc.)
      if (current.weekday == DateTime.tuesday) {
        sessions.add(TrainingSession(
          date: current,
          type: SessionType.paradeNight,
        ));
      }
      current = current.add(const Duration(days: 1));
    }

    state = state.copyWith(sessions: sessions);
  }

  void updateSession(TrainingSession updatedSession) {
    state = state.copyWith(
      sessions: state.sessions.map((s) => s.id == updatedSession.id ? updatedSession : s).toList(),
    );
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
  }
}

final trainingProvider = StateNotifierProvider<TrainingController, TrainingState>((ref) {
  return TrainingController();
});
