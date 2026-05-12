import '../domain/training_session.dart';

class Lesson {
  final String code;
  final String title;
  final Phase phase;
  final int periods;
  final bool isMandatory;
  final String category; // Fundamental, Elemental, Optional

  const Lesson({
    required this.code,
    required this.title,
    required this.phase,
    required this.periods,
    this.isMandatory = false,
    this.category = 'Fundamental',
  });
}

class LessonLibrary {
  static const List<Lesson> allLessons = [
    // --- PHASE 1 ---
    // Fundamental Training
    Lesson(code: 'M100', title: 'PHASE', phase: Phase.phase1, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C', title: 'Participate in Citizenship Activities', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01', title: 'Perform Community Service', phase: Phase.phase1, periods: 9, isMandatory: true),
    Lesson(code: 'M103.01', title: 'Identify the Responsibilities of a Follower in a Team', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M103.03', title: 'Participate in Team Building Activities', phase: Phase.phase1, periods: 2, isMandatory: true),
    Lesson(code: 'MX04.01', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02', title: 'Identify Strategies to Improve Participation in Physical Activities', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01', title: 'Participate in Physical Activities', phase: Phase.phase1, periods: 9, isMandatory: true),
    Lesson(code: 'M106.01', title: 'Identify the Parts and Characteristics of the Daisy 853C Air Rifle', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M106.02', title: 'Carry out Safety Precautions on the Cadet Air Rifle', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M106.04', title: 'Follow Rules and Commands on an Air Rifle Range', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M107.01', title: 'Discuss Year One Training', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M107.02', title: 'Identify Sea Cadet and Naval Officer Ranks', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M107.03', title: 'Observe Rules and Procedures for Paying Compliments', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M107.04', title: 'State the Motto and History of the Sea Cadet Program', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M107.05', title: 'Wear the Sea Cadet Uniform', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.01', title: 'Adopt the Positions of Attention, Stand at Ease, and Stand Easy', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.02', title: 'Execute a Salute at the Halt Without Arms', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.03', title: 'Execute Turns at the Halt', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.04', title: 'Close to the Right and Left', phase: Phase.phase1, periods: 1, isMandatory: true),
    
    // Elemental Training (Phase 1)
    Lesson(code: 'M121.01', title: 'Tie Knots, Bends and Hitches', phase: Phase.phase1, periods: 6, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M121.02', title: 'Whip the End of a Line Using a Common Whipping', phase: Phase.phase1, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M121.03', title: 'Coil and Heave a Line', phase: Phase.phase1, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M123.01', title: 'Define Basic Naval Terminology', phase: Phase.phase1, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M123.02', title: 'Identify Pipes and the Correct Responses', phase: Phase.phase1, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M123.03', title: 'Participate in a Review of Ship\'s Operations', phase: Phase.phase1, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M124.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase1, periods: 1, isMandatory: true, category: 'Elemental'),
  ];

  static List<Lesson> getLessonsForPhase(Phase phase) {
    return allLessons.where((l) => l.phase == phase).toList();
  }
}
