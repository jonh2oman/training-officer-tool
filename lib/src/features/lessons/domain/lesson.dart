import '../../calendar/domain/training_session.dart';

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
  static final List<Lesson> allLessons = [
    // ==========================================
    // PHASE 1
    // ==========================================
    // Phase 1 Fundamental (Mandatory)
    Lesson(code: 'M100-P1', title: 'PHASE', phase: Phase.phase1, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C-P1', title: 'Participate in Citizenship Activities', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01-P1', title: 'Perform Community Service', phase: Phase.phase1, periods: 9, isMandatory: true),
    Lesson(code: 'M103.01', title: 'Identify the Responsibilities of a Follower in a Team', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M103.03', title: 'Participate in Team building Activities', phase: Phase.phase1, periods: 2, isMandatory: true),
    Lesson(code: 'MX04.01-P1', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02-P1', title: 'Identify Strategies to Improve Participation in Physical Activities', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01-P1', title: 'Participate in Physical Activities', phase: Phase.phase1, periods: 9, isMandatory: true),
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
    Lesson(code: 'M108.05', title: 'Execute Paces Forward and to the Rear', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.06', title: 'Execute the Movements Required for a Right Dress', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.07', title: 'Execute an Open Order and Close Order March', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.08', title: 'March and Halt in Quick Time', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.09', title: 'Execute Marking Time, Forward, and Halting in Quick Time', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.11', title: 'Pay Compliments with a Squad on the March', phase: Phase.phase1, periods: 1, isMandatory: true),
    Lesson(code: 'M108.12', title: 'Perform Drill Movements During ACR', phase: Phase.phase1, periods: 3, isMandatory: true),
    Lesson(code: 'MX20.01-P1', title: 'Participate in a CAF Engagement Activity', phase: Phase.phase1, periods: 9, isMandatory: true),

    // Phase 1 Fundamental (Complementary)
    Lesson(code: 'CX01.01-P1', title: 'Participate in Citizenship Activities', phase: Phase.phase1, periods: 18),
    Lesson(code: 'CX02.01-P1', title: 'Perform Community Service', phase: Phase.phase1, periods: 18),
    Lesson(code: 'M103.02', title: 'Map Personal Goals for the Training Year', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C103.01', title: 'Participate in Icebreaker Activities', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C103.02', title: 'Participate in Self-Introductions', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C103.03', title: 'Participate in Team building Activities', phase: Phase.phase1, periods: 1),
    Lesson(code: 'MX04.03', title: 'Participate in the CFA', phase: Phase.phase1, periods: 3),
    Lesson(code: 'CX04.01-P1', title: 'Participate in the CFA and Identify Strategies', phase: Phase.phase1, periods: 3),
    Lesson(code: 'CX04.02-P1', title: 'Participate in Activities for Physical Fitness', phase: Phase.phase1, periods: 3),
    Lesson(code: 'CX04.03-P1', title: 'Participate in a Cooking Class', phase: Phase.phase1, periods: 3),
    Lesson(code: 'CX04.04-P1', title: 'Attend a Healthy Living Presentation', phase: Phase.phase1, periods: 3),
    Lesson(code: 'CX04.05-P1', title: 'Attend a Local Amateur Sporting Event', phase: Phase.phase1, periods: 3),
    Lesson(code: 'CX05.01-P1', title: 'Participate in Physical Activities', phase: Phase.phase1, periods: 9),
    Lesson(code: 'CX05.02-P1', title: 'Participate in a Tournament', phase: Phase.phase1, periods: 9),
    Lesson(code: 'M106.03', title: 'Apply Basic Marksmanship Techniques', phase: Phase.phase1, periods: 2),
    Lesson(code: 'M106.05', title: 'Participate in Marksmanship Familiarization', phase: Phase.phase1, periods: 3),
    Lesson(code: 'C106.01', title: 'Participate in a Recreational Marksmanship Activity', phase: Phase.phase1, periods: 3),
    Lesson(code: 'C106.02', title: 'Clean and Store the Cadet Air Rifle', phase: Phase.phase1, periods: 1),
    Lesson(code: 'M107.06', title: 'Discuss Summer Training Opportunities', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C107.01', title: 'Maintain the Sea Cadet Uniform', phase: Phase.phase1, periods: 2),
    Lesson(code: 'C107.02', title: 'Participate in a Tour of the Corps', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C107.03', title: 'Participate in an Activity about the History of the Corps', phase: Phase.phase1, periods: 1),
    Lesson(code: 'M108.10', title: 'Execute a Salute on the March', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C108.01', title: 'Execute Supplementary Drill Movements', phase: Phase.phase1, periods: 6),
    Lesson(code: 'C108.02', title: 'Participate in a Drill Competition', phase: Phase.phase1, periods: 3),
    Lesson(code: 'C111.01', title: 'Participate in a Biathlon Briefing', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C111.02', title: 'Run Wind Sprints', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C111.03', title: 'Simulate Firing Following Physical Activity', phase: Phase.phase1, periods: 1),
    Lesson(code: 'C111.04', title: 'Participate in a Recreational Summer Biathlon Activity', phase: Phase.phase1, periods: 6),
    Lesson(code: 'CX20.01-P1', title: 'Participate in CAF Familiarization Activities', phase: Phase.phase1, periods: 18),
    Lesson(code: 'ACR', title: 'Participate in the Annual Ceremonial Review (ACR)', phase: Phase.phase1, periods: 3),

    // Phase 1 Elemental (Mandatory)
    Lesson(code: 'M121.01', title: 'Tie Knots, Bends and Hitches', phase: Phase.phase1, periods: 6, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M121.02', title: 'Whip the End of a Line Using a Common Whipping', phase: Phase.phase1, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M121.03', title: 'Coil and Heave a Line', phase: Phase.phase1, periods: 3, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M123.01', title: 'Define Basic Naval Terminology', phase: Phase.phase1, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M123.02', title: 'Identify Pipes and the Correct Responses', phase: Phase.phase1, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M123.03', title: 'Participate in a Review of Ship\'s Operations', phase: Phase.phase1, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M124.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase1, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C125.01', title: 'Prepare for a Nautical Training Weekend', phase: Phase.phase1, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'C125.02', title: 'Participate in a Nautical Training Weekend', phase: Phase.phase1, periods: 9, isMandatory: true, category: 'Elemental'),

    // Phase 1 Elemental (Complementary)
    Lesson(code: 'C121.01', title: 'West Country Whipping', phase: Phase.phase1, periods: 1, category: 'Elemental'),
    Lesson(code: 'C121.02', title: 'Sailmaker\'s Whipping', phase: Phase.phase1, periods: 2, category: 'Elemental'),
    Lesson(code: 'C121.03', title: 'Complete a Rolling Hitch', phase: Phase.phase1, periods: 1, category: 'Elemental'),
    Lesson(code: 'C121.04', title: 'Complete a Marlin Hitch', phase: Phase.phase1, periods: 1, category: 'Elemental'),
    Lesson(code: 'C123.01', title: 'Read the 24-hour Clock', phase: Phase.phase1, periods: 1, category: 'Elemental'),
    Lesson(code: 'C123.02', title: 'Recite the Phonetic Alphabet', phase: Phase.phase1, periods: 2, category: 'Elemental'),
    Lesson(code: 'C123.03', title: 'Participate in a Semaphore Exercise', phase: Phase.phase1, periods: 5, category: 'Elemental'),
    Lesson(code: 'C123.04', title: 'Ring the Ship\'s Bell', phase: Phase.phase1, periods: 1, category: 'Elemental'),
    Lesson(code: 'M124.02', title: 'Participate in a Sail Weekend', phase: Phase.phase1, periods: 18, category: 'Elemental'),
    Lesson(code: 'C124.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase1, periods: 1, category: 'Elemental'),

    // ==========================================
    // PHASE 2
    // ==========================================
    // Phase 2 Fundamental (Mandatory)
    Lesson(code: 'M100-P2', title: 'PHASE', phase: Phase.phase2, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C-P2', title: 'Participate in Citizenship Activities', phase: Phase.phase2, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01-P2', title: 'Perform Community Service', phase: Phase.phase2, periods: 9, isMandatory: true),
    Lesson(code: 'M203.01', title: 'Discuss Leadership Within a Peer Setting', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.02', title: 'Discuss the Principles of Leadership', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.03', title: 'Discuss Effective Communication', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.04', title: 'Demonstrate Positive Group Dynamics', phase: Phase.phase2, periods: 2, isMandatory: true),
    Lesson(code: 'M203.05', title: 'Discuss Influence Behaviours', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.06', title: 'Employ Problem Solving', phase: Phase.phase2, periods: 2, isMandatory: true),
    Lesson(code: 'M203.07', title: 'Discuss Personal Integrity', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M203.08', title: 'Participate in Team-Building Activities', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'MX04.01-P2', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase2, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02-P2', title: 'Identify Strategies to Improve Participation', phase: Phase.phase2, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01-P2', title: 'Participate in Physical Activities', phase: Phase.phase2, periods: 9, isMandatory: true),
    Lesson(code: 'M207.01', title: 'Identify Phase Two Training Opportunities', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M207.03', title: 'Recognize the Role of the Local Sponsor', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'M208.01', title: 'Execute Left and Right Turns on the March', phase: Phase.phase2, periods: 2, isMandatory: true),
    Lesson(code: 'M208.02', title: 'Form Single File From the Halt', phase: Phase.phase2, periods: 1, isMandatory: true),
    Lesson(code: 'MX20.01-P2', title: 'Participate in a CAF Engagement Activity', phase: Phase.phase2, periods: 9, isMandatory: true),

    // Phase 2 Fundamental (Complementary)
    Lesson(code: 'C203.01', title: 'Record Entries in a Reflective Journal', phase: Phase.phase2, periods: 3),
    Lesson(code: 'C203.02', title: 'Employ Problem Solving', phase: Phase.phase2, periods: 2),
    Lesson(code: 'C203.03', title: 'Discuss Characteristics of a Leader', phase: Phase.phase2, periods: 2),
    Lesson(code: 'C203.04', title: 'Participate in a Presentation Given by a Leader', phase: Phase.phase2, periods: 2),
    Lesson(code: 'C203.05', title: 'Participate in Trust-Building Activities', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C203.06', title: 'Participate in Problem-Solving Activities', phase: Phase.phase2, periods: 2),
    Lesson(code: 'M206.01', title: 'Participate in a Recreational Marksmanship Activity', phase: Phase.phase2, periods: 3),
    Lesson(code: 'C206.01', title: 'Practice Holding Techniques', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C206.02', title: 'Practice Aiming Techniques', phase: Phase.phase2, periods: 2),
    Lesson(code: 'C206.03', title: 'Practice Firing Techniques', phase: Phase.phase2, periods: 1),
    Lesson(code: 'M207.02', title: 'Recognize Historical Aspects of Sea Cadets', phase: Phase.phase2, periods: 1),
    Lesson(code: 'M207.04', title: 'Identify Year Two CSTC Opportunities', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C207.01', title: 'Identify Rank Structure of Army/Air Cadets', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C207.02', title: 'Visit a Local Cadet Corps or Squadron', phase: Phase.phase2, periods: 3),
    Lesson(code: 'C207.03', title: 'Describe the Affiliated Unit', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C207.04', title: 'Participate in a Tour of the Affiliated Unit', phase: Phase.phase2, periods: 3),
    Lesson(code: 'C208.01', title: 'Practice Ceremonial Drill as a Review', phase: Phase.phase2, periods: 2),
    Lesson(code: 'C208.02', title: 'Execute Drill With Arms', phase: Phase.phase2, periods: 8),
    Lesson(code: 'C211.01', title: 'Identify Civilian Biathlon Opportunities', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C211.02', title: 'Run on Alternate Terrain', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C211.03', title: 'Fire the Cadet Air Rifle using a Sling', phase: Phase.phase2, periods: 1),
    Lesson(code: 'C211.04', title: 'Participate in a Competitive Summer Biathlon Activity', phase: Phase.phase2, periods: 6),

    // Phase 2 Elemental (Mandatory)
    Lesson(code: 'M221.01', title: 'Use a Strop for Slinging', phase: Phase.phase2, periods: 3, isMandatory: true, category: 'Elemental'),
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

    // Phase 2 Elemental (Complementary)
    Lesson(code: 'M221.02', title: 'Mouse a Hook', phase: Phase.phase2, periods: 2, category: 'Elemental'),
    Lesson(code: 'C221.01', title: 'Make a Back Splice', phase: Phase.phase2, periods: 2, category: 'Elemental'),
    Lesson(code: 'C221.02', title: 'Make an Eye Splice', phase: Phase.phase2, periods: 2, category: 'Elemental'),
    Lesson(code: 'C221.03', title: 'Make a Long Splice', phase: Phase.phase2, periods: 2, category: 'Elemental'),
    Lesson(code: 'M223.07', title: 'Identify the Procedure for Berthing a Ship', phase: Phase.phase2, periods: 2, category: 'Elemental'),
    Lesson(code: 'C223.01', title: 'Define Naval Terminology', phase: Phase.phase2, periods: 1, category: 'Elemental'),
    Lesson(code: 'C223.02', title: 'Pipe the Side', phase: Phase.phase2, periods: 1, category: 'Elemental'),

    // ==========================================
    // PHASE 3
    // ==========================================
    // Phase 3 Fundamental (Mandatory)
    Lesson(code: 'M100-P3', title: 'PHASE', phase: Phase.phase3, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C-P3', title: 'Participate in Citizenship Activities', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01-P3', title: 'Perform Community Service', phase: Phase.phase3, periods: 9, isMandatory: true),
    Lesson(code: 'M303.01', title: 'Define the Role of a Team Leader', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.02', title: 'Participate in a Mentoring Relationship', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M303.03', title: 'Practice Self-Assessment', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M303.04', title: 'Communicate as a Team Leader', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.05', title: 'Supervise Cadets', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.06', title: 'Solve Problems', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M303.07', title: 'Lead Cadets Through a Leadership Assignment', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'MX04.01-P3', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02-P3', title: 'Identify Strategies to Improve Participation', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01-P3', title: 'Participate in Physical Activities', phase: Phase.phase3, periods: 9, isMandatory: true),
    Lesson(code: 'M307.01', title: 'Identify Phase Three Training Opportunities', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M307.03', title: 'Partnership Between Navy League and DND', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M308.01', title: 'Prepare a Squad for Parade', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'M308.02', title: 'Deliver Words of Command', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M309.01', title: 'Explain Principles of Instruction', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.02', title: 'Identify Methods of Instruction', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.03', title: 'Describe Effective Speaking Techniques', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M309.04', title: 'Describe Questioning Techniques', phase: Phase.phase3, periods: 1, isMandatory: true),
    Lesson(code: 'M309.05', title: 'Select Appropriate Instructional Aids', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.06', title: 'Plan a Lesson', phase: Phase.phase3, periods: 2, isMandatory: true),
    Lesson(code: 'M309.07', title: 'Instruct a 15-Minute Lesson', phase: Phase.phase3, periods: 3, isMandatory: true),
    Lesson(code: 'MX20.01-P3', title: 'Participate in a CAF Engagement Activity', phase: Phase.phase3, periods: 9, isMandatory: true),

    // Phase 3 Fundamental (Complementary)
    Lesson(code: 'C303.01', title: 'Lead Team-Building Activities', phase: Phase.phase3, periods: 3),
    Lesson(code: 'C303.02', title: 'Deliver a Presentation About a Leader', phase: Phase.phase3, periods: 2),
    Lesson(code: 'M306.01', title: 'Participate in a Recreational Marksmanship Activity', phase: Phase.phase3, periods: 3),
    Lesson(code: 'C306.01', title: 'Identify Civilian Marksmanship Organizations', phase: Phase.phase3, periods: 1),
    Lesson(code: 'C306.02', title: 'Correct Marksmanship Error', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C306.03', title: 'Fire the Cadet Air Rifle Standing Position', phase: Phase.phase3, periods: 2),
    Lesson(code: 'M307.02', title: 'Identify Year Three CSTC Opportunities', phase: Phase.phase3, periods: 1),
    Lesson(code: 'C307.01', title: 'Presentation Given by Guest Speaker (RCSU)', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C307.02', title: 'Presentation Given by the CLO', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C307.03', title: 'Presentation Given by Guest Speaker (NLC)', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C307.04', title: 'Presentation Duke of Edinburgh Award', phase: Phase.phase3, periods: 1),
    Lesson(code: 'C308.01', title: 'Execute Flag Party Drill', phase: Phase.phase3, periods: 4),
    Lesson(code: 'C308.02', title: 'Deliver Words of Command', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C309.01', title: 'Deliver a One-Minute Verbal Presentation', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C309.02', title: 'Plan a Lesson', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C309.03', title: 'Instruct a 15-Minute Lesson', phase: Phase.phase3, periods: 3),
    Lesson(code: 'C309.04', title: 'Identify Formations for Drill Instruction', phase: Phase.phase3, periods: 1),
    Lesson(code: 'C309.05', title: 'Plan a Drill Lesson', phase: Phase.phase3, periods: 2),
    Lesson(code: 'C309.06', title: 'Instruct a 15-Minute Drill Lesson', phase: Phase.phase3, periods: 3),
    Lesson(code: 'C311.01', title: 'Practice Aiming and Firing Following Physical Activity', phase: Phase.phase3, periods: 3),
    Lesson(code: 'C311.02', title: 'Participate in a Recreational Summer Biathlon Activity', phase: Phase.phase3, periods: 6),

    // Phase 3 Elemental (Mandatory)
    Lesson(code: 'PO 322', title: 'Attain Pleasure Craft Operator Competency', phase: Phase.phase3, periods: 15, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'M323.01', title: 'Perform Corps Duties', phase: Phase.phase3, periods: 2, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'MX24.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase3, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.01', title: 'Prepare for a Nautical Training Weekend', phase: Phase.phase3, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.02', title: 'Participate in a Nautical Activity', phase: Phase.phase3, periods: 9, isMandatory: true, category: 'Elemental'),

    // Phase 3 Elemental (Complementary)
    Lesson(code: 'M321.01', title: 'Safety Procedures for Operating Lifting Devices', phase: Phase.phase3, periods: 1, category: 'Elemental'),
    Lesson(code: 'M321.02', title: 'Rig Sheers', phase: Phase.phase3, periods: 5, category: 'Elemental'),
    Lesson(code: 'C321.01', title: 'Rig Sheers', phase: Phase.phase3, periods: 4, category: 'Elemental'),
    Lesson(code: 'C321.02', title: 'Rig a Standing Derrick', phase: Phase.phase3, periods: 6, category: 'Elemental'),
    Lesson(code: 'C321.03', title: 'Rig a Gyn', phase: Phase.phase3, periods: 6, category: 'Elemental'),
    Lesson(code: 'C321.04', title: 'Make a Monkey\'s Fist', phase: Phase.phase3, periods: 3, category: 'Elemental'),
    Lesson(code: 'C321.05', title: 'Make a Turk\'s Head', phase: Phase.phase3, periods: 3, category: 'Elemental'),
    Lesson(code: 'C323.01', title: 'Communicate Using Flags and Pennants', phase: Phase.phase3, periods: 4, category: 'Elemental'),
    Lesson(code: 'C323.02', title: 'Pipe Wakey Wakey', phase: Phase.phase3, periods: 2, category: 'Elemental'),
    Lesson(code: 'C323.03', title: 'Pipe Hands to Dinner', phase: Phase.phase3, periods: 3, category: 'Elemental'),

    // ==========================================
    // PHASE 4
    // ==========================================
    // Phase 4 Fundamental (Mandatory)
    Lesson(code: 'M100-P4', title: 'PHASE', phase: Phase.phase4, periods: 6, isMandatory: true),
    Lesson(code: 'MX01.01C-P4', title: 'Participate in Citizenship Activities', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX02.01-P4', title: 'Perform Community Service', phase: Phase.phase4, periods: 9, isMandatory: true),
    Lesson(code: 'M403.01', title: 'Describe Needs of Team Members', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M403.02', title: 'Select a Leadership Approach', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.03', title: 'Describe How to Motivate Team Members', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.04', title: 'Provide Feedback to Team Members', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.05', title: 'Participate in a Mentoring Relationship', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M403.06', title: 'Act as a Team Leader During Assignment', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'MX04.01-P4', title: 'Participate in 60 Minutes of MVPA', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX04.02-P4', title: 'Identify Strategies to Improve Participation', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX05.01-P4', title: 'Participate in Physical Activities', phase: Phase.phase4, periods: 9, isMandatory: true),
    Lesson(code: 'M407.01', title: 'Identify Phase Four Training Opportunities', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'C407.01', title: 'Prepare for a Merit Review Board', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.01', title: 'Discuss Commanding a Division on Parade', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.02', title: 'Identify Parade Sequence', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.03', title: 'Command a Squad', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M408.04', title: 'Inspect a Cadet on Parade', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.01', title: 'Identify Methods of Instruction', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.02', title: 'Identify Positive Learning Environment', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.03', title: 'Describe Learner Needs', phase: Phase.phase4, periods: 2, isMandatory: true),
    Lesson(code: 'M409.04', title: 'Explain Assessment', phase: Phase.phase4, periods: 1, isMandatory: true),
    Lesson(code: 'M409.05', title: 'Instruct a 30-Minute Lesson', phase: Phase.phase4, periods: 3, isMandatory: true),
    Lesson(code: 'MX20.01-P4', title: 'Participate in a CAF Engagement Activity', phase: Phase.phase4, periods: 9, isMandatory: true),

    // Phase 4 Fundamental (Complementary)
    Lesson(code: 'C403.01', title: 'Self-Assess Leadership Skills', phase: Phase.phase4, periods: 1),
    Lesson(code: 'C403.02', title: 'Participate in a Leadership Seminar', phase: Phase.phase4, periods: 12),
    Lesson(code: 'M406.01', title: 'Participate in a Recreational Marksmanship Activity', phase: Phase.phase4, periods: 3),
    Lesson(code: 'C406.01', title: 'Assist the RSO', phase: Phase.phase4, periods: 1),
    Lesson(code: 'C406.02', title: 'Score Air Rifle Marksmanship Targets', phase: Phase.phase4, periods: 1),
    Lesson(code: 'M407.02', title: 'Identify Year Four CSTC Opportunities', phase: Phase.phase4, periods: 1),
    Lesson(code: 'C408.01', title: 'Discuss the History of Drill', phase: Phase.phase4, periods: 1),
    Lesson(code: 'C408.02', title: 'View a Re-Enactment of the History of Drill', phase: Phase.phase4, periods: 3),
    Lesson(code: 'C308.03', title: 'Practice Voice for Calling Drill Commands', phase: Phase.phase4, periods: 2),
    Lesson(code: 'C409.01', title: 'Plan a Lesson', phase: Phase.phase4, periods: 2),
    Lesson(code: 'C409.02', title: 'Instruct a 30-Minute Lesson', phase: Phase.phase4, periods: 3),
    Lesson(code: 'C409.03', title: 'Act as an Assistant Instructor', phase: Phase.phase4, periods: 3),
    Lesson(code: 'C409.04', title: 'Creative Lesson Planning Workshop', phase: Phase.phase4, periods: 2),
    Lesson(code: 'C409.05', title: 'Act as an Assistant Drill Instructor', phase: Phase.phase4, periods: 3),
    Lesson(code: 'C409.06', title: 'Instruct a 30-Minute Drill Lesson', phase: Phase.phase4, periods: 3),

    // Phase 4 Elemental (Mandatory)
    Lesson(code: 'C422', title: 'Restricted Operator\'s Certificate (Maritime)', phase: Phase.phase4, periods: 16, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'MX24.01', title: 'Prepare for a Sail Weekend', phase: Phase.phase4, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.01', title: 'Prepare for a Nautical Training Weekend', phase: Phase.phase4, periods: 1, isMandatory: true, category: 'Elemental'),
    Lesson(code: 'CX25.02', title: 'Participate in a Nautical Activity', phase: Phase.phase4, periods: 9, isMandatory: true, category: 'Elemental'),

    // Phase 4 Elemental (Complementary)
    Lesson(code: 'C421.01', title: 'Make a Boatswain\'s Belt', phase: Phase.phase4, periods: 2, category: 'Elemental'),
    Lesson(code: 'C421.02', title: 'Make a Round Mat', phase: Phase.phase4, periods: 3, category: 'Elemental'),
    Lesson(code: 'C421.03', title: 'Make a Net Hammock', phase: Phase.phase4, periods: 3, category: 'Elemental'),
    Lesson(code: 'M423.01', title: 'Identify Aspects of a Chart', phase: Phase.phase4, periods: 2, category: 'Elemental'),
    Lesson(code: 'M423.02', title: 'Use Navigation Instruments', phase: Phase.phase4, periods: 2, category: 'Elemental'),
    Lesson(code: 'M423.03', title: 'Describe Latitude and Longitude', phase: Phase.phase4, periods: 4, category: 'Elemental'),
    Lesson(code: 'M423.04', title: 'Plot a Fix', phase: Phase.phase4, periods: 2, category: 'Elemental'),
    Lesson(code: 'C423.01', title: 'Plot a Position (Three-Bearing Fix)', phase: Phase.phase4, periods: 2, category: 'Elemental'),
    Lesson(code: 'C423.02', title: 'Plot a Position (Horizontal-Angle Fix)', phase: Phase.phase4, periods: 2, category: 'Elemental'),

    // ==========================================
    // OPTIONAL / CORPS ACTIVITIES (Across all phases)
    // ==========================================
    ...Phase.values.expand((p) => <Lesson>[
      Lesson(code: 'OPT-DRILL-P${p.index + 1}', title: 'Drill Team Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'OPT-MUSIC-P${p.index + 1}', title: 'Music Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'OPT-MARK-P${p.index + 1}', title: 'Marksmanship Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'OPT-BIAT-P${p.index + 1}', title: 'Biathlon Practice', phase: p, periods: 10, category: 'Optional'),
      Lesson(code: 'OPT-ORIENT-P${p.index + 1}', title: 'Orienteering Practice', phase: p, periods: 10, category: 'Optional'),
      Lesson(code: 'OPT-BOAT-P${p.index + 1}', title: 'Model Boat Club', phase: p, periods: 10, category: 'Optional'),
      Lesson(code: 'OPT-SEAM-P${p.index + 1}', title: 'Seamanship Team Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'EVT-HALW-P${p.index + 1}', title: "Hallowe'en Costume Dance", phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-POPPY-P${p.index + 1}', title: 'Poppy Campaign', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-REMB-P${p.index + 1}', title: 'Remembrance Day Visit', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-XMAS-P${p.index + 1}', title: 'Christmas Mess Dinner', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-CAROL-P${p.index + 1}', title: "Caroling at Veterans' Home", phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-SANTA-P${p.index + 1}', title: 'Santa Claus Parade', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-TREAS-P${p.index + 1}', title: 'Treasure Hunt Day', phase: p, periods: 1, category: 'Optional'),
      Lesson(code: 'EVT-ANML-P${p.index + 1}', title: 'Volunteering at Animal Shelter', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-SWIM-P${p.index + 1}', title: 'Swimming night', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-PIRAT-P${p.index + 1}', title: 'Pirate Sports Day', phase: p, periods: 1, category: 'Optional'),
      Lesson(code: 'EVT-VALNT-P${p.index + 1}', title: "Valentine's Skating Party", phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-YOGA-P${p.index + 1}', title: 'Yoga day', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-MOVIE-P${p.index + 1}', title: 'Movie night', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-GEOC-P${p.index + 1}', title: 'Geocaching', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-RELAY-P${p.index + 1}', title: 'Charity Relay', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-MUSE-P${p.index + 1}', title: 'Maritime Museum Tour', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-BARBQ-P${p.index + 1}', title: 'End-of-Year Barbecue', phase: p, periods: 3, category: 'Optional'),
    ]).toList(),
  ];

  static List<Lesson> getLessonsForPhase(Phase phase) {
    return allLessons.where((l) => l.phase == phase).toList();
  }
}
