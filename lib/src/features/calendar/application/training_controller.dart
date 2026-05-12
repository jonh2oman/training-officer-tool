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
  
  void addSession(DateTime date, SessionType type) {
    state = state.copyWith(
      sessions: [...state.sessions, TrainingSession(date: date, type: type)]..sort((a, b) => a.date.compareTo(b.date)),
    );
  }
}

final trainingProvider = StateNotifierProvider<TrainingController, TrainingState>((ref) {
  return TrainingController();
});
