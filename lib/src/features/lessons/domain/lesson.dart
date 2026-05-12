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

    // --- PHASE 2 ---
    // Fundamental
    Lesson(code: 'M100', title: 'PHASE', phase: Phase.phase2, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C', title: 'Participate in Citizenship Activities', phase: Phase.phase2, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01', title: 'Perform Community Service', phase: Phase.phase2, periods: 9, isMandatory: true),
    Lesson(code: 'M203.01', title: 'Discuss Leadership Within a Peer Setting', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.02', title: 'Discuss the Principles of Leadership', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.03', title: 'Discuss Effective Communication in a Peer Setting', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.04', title: 'Demonstrate Positive Group Dynamics', phase: Phase.phase2, periods: 2, isMandatory: true),
    Lesson(code: 'M203.05', title: 'Discuss Influence Behaviours', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.06', title: 'Employ Problem Solving', phase: Phase.phase2, periods: 2, isMandatory: true),
    Lesson(code: 'M203.07', title: 'Discuss Personal Integrity as a Quality of Leadership', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.08', title: 'Participate in Team-Building Activities', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'MX04.01', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase2, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02', title: 'Identify Strategies to Improve Participation', phase: Phase.phase2, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01', title: 'Participate in Physical Activities', phase: Phase.phase2, periods: 9, isMandatory: true),
    Lesson(code: 'M207.01', title: 'Identify Phase Two Training Opportunities', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M207.03', title: 'Recognize the Role and Responsibilities of the Local Sponsor', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M208.01', title: 'Execute Left and Right Turns on the March', phase: Phase.phase2, periods: 2, isMandatory: true),
    Lesson(code: 'M208.02', title: 'Form Single File from the Halt', phase: Phase.phase2, periods: 1, isMandatory: true),
    // Elemental
    Lesson(code: 'M221.01', title: 'Use a Strap for Slinging', phase: Phase.phase2, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M221.03', title: 'Reeve a Block', phase: Phase.phase2, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M221.04', title: 'Identify Components of Tackles', phase: Phase.phase2, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M221.05', title: 'Rig Tackles', phase: Phase.phase2, periods: 6, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M223.01', title: 'Define Ship-Related Terms', phase: Phase.phase2, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M223.02', title: 'Identify the Watch System', phase: Phase.phase2, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M223.03', title: 'Execute Notes Using the Boatswain\'s Call', phase: Phase.phase2, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M223.04', title: 'Pipe the General Call', phase: Phase.phase2, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M223.05', title: 'Pipe the Still', phase: Phase.phase2, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M223.06', title: 'Pipe the Carry On', phase: Phase.phase2, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'MX24.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase2, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.01', title: 'Prepare for a Nautical Training Weekend', phase: Phase.phase2, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.02', title: 'Participate in a Nautical Training Weekend', phase: Phase.phase2, periods: 9, isMandatory: true, category: 'Elemental'),

    // --- PHASE 3 ---
    // Fundamental
    Lesson(code: 'M100', title: 'PHASE', phase: Phase.phase3, periods: 6, isMandatory: true),
    Lesson(code: 'M301.01C', title: 'Participate in Citizenship Activities', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01', title: 'Perform Community Service', phase: Phase.phase3, periods: 9, isMandatory: true),
    Lesson(code: 'M303.01', title: 'Define the Role of a Team Leader', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.02', title: 'Participate in a Mentoring Relationship', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M303.03', title: 'Practice Self-Assessment', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M303.04', title: 'Communicate as a Team Leader', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.05', title: 'Supervise Cadets', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.06', title: 'Solve Problems', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.07', title: 'Lead Cadets Through a Leadership Assignment', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M304.01', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02', title: 'Identify Strategies to Improve Participation', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01', title: 'Participate in Physical Activities', phase: Phase.phase3, periods: 9, isMandatory: true),
    Lesson(code: 'M307.01', title: 'Identify Phase Three Training Opportunities', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M307.03', title: 'Recognize the Partnership Between Navy League and DND', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M308.01', title: 'Prepare a Squad for Parade', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'M308.02', title: 'Deliver Words of Command', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M309.01', title: 'Explain Principles of Instruction', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.02', title: 'Identify Methods of Instruction', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.03', title: 'Describe Effective Speaking Techniques', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M309.04', title: 'Describe Questioning Techniques', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M309.05', title: 'Select Appropriate Instructional Aids', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.06', title: 'Plan a Lesson', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.07', title: 'Instruct a 15-Minute Lesson', phase: Phase.phase3, periods: 3, isMandatory: true),
    // Elemental
    Lesson(code: 'PO 322', title: 'Attain Pleasure Craft Operator Competency', phase: Phase.phase3, periods: 15, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M323.01', title: 'Perform Corps Duties', phase: Phase.phase3, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'MX24.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase3, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.01', title: 'Prepare for a Nautical Training Weekend', phase: Phase.phase3, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.02', title: 'Participate in a Nautical Activity', phase: Phase.phase3, periods: 9, isMandatory: true, category: 'Elemental'),

    // --- PHASE 4 ---
    // Fundamental
    Lesson(code: 'M100', title: 'PHASE', phase: Phase.phase4, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C', title: 'Participate in Citizenship Activities', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01', title: 'Perform Community Service', phase: Phase.phase4, periods: 9, isMandatory: true),
    Lesson(code: 'M403.01', title: 'Describe Needs and Expectations of Team Members', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M403.02', title: 'Select a Leadership Approach', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.03', title: 'Describe How to Motivate Team Members', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.04', title: 'Provide Feedback to Team Members', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.05', title: 'Participate in a Mentoring Relationship', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.06', title: 'Act as a Team Leader During a Leadership Assignment', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'MX04.01', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02', title: 'Identify Strategies to Improve Participation', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01', title: 'Participate in Physical Activities', phase: Phase.phase4, periods: 9, isMandatory: true),
    Lesson(code: 'M407.01', title: 'Identify Phase Four Training Opportunities', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'C407.01', title: 'Prepare for a Merit Review Board', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.01', title: 'Discuss Commanding a Division on Parade', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.02', title: 'Identify Parade Sequence', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.03', title: 'Command a Squad', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.04', title: 'Inspect a Cadet on Parade', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.01', title: 'Identify Methods of Instruction', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.02', title: 'Identify Elements of a Positive Learning Environment', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.03', title: 'Describe Learner Needs', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.04', title: 'Explain Assessment', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M409.05', title: 'Instruct a 30-Minute Lesson', phase: Phase.phase4, periods: 3, isMandatory: true),
    // Elemental
    Lesson(code: 'C422', title: 'Attain Restricted Operator\'s Certificate (Maritime)', phase: Phase.phase4, periods: 18, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'MX24.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase4, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.01', title: 'Prepare for a Nautical Training Weekend', phase: Phase.phase4, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.02', title: 'Participate in a Nautical Activity', phase: Phase.phase4, periods: 9, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C421.01', title: 'Make a Boatswain\'s Belt', phase: Phase.phase4, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C421.02', title: 'Make a Round Mat', phase: Phase.phase4, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C421.03', title: 'Make a Net Hammock', phase: Phase.phase4, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C321.02', title: 'Rig a Standing Derrick', phase: Phase.phase4, periods: 6, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C321.03', title: 'Rig a Gyn', phase: Phase.phase4, periods: 6, isMandatory: true, category: 'Elemental'),
  ];

  static List<Lesson> getLessonsForPhase(Phase phase) {
    return allLessons.where((l) => l.phase == phase).toList();
  }
}
