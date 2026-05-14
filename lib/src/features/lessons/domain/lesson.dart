import '../../calendar/domain/training_session.dart';

class Lesson {
  final String code;
  final String title;
  final Phase phase;
  final int periods;
  final bool isMandatory;
  final List<CadetElement> elements;
  final String category; // Fundamental, Elemental, Optional

  const Lesson({
    required this.code,
    required this.title,
    required this.phase,
    required this.periods,
    this.elements = CadetElement.values, // Default to all elements (Common)
    this.isMandatory = false,
    this.category = 'Fundamental',
  });
}

class LessonLibrary {
  static final List<Lesson> allLessons = [
    // =========================================================================
    // LEVEL 1 / PHASE 1 / GREEN STAR
    // =========================================================================
    
    // COMMON - Level 1 Fundamental (Mandatory)
    ..._buildCommonLevel1(),

    // SEA SPECIFIC - Phase 1
    ..._buildSeaLevel1(),

    // ARMY SPECIFIC - Green Star
    ..._buildArmyLevel1(),

    // AIR SPECIFIC - Level 1
    ..._buildAirLevel1(),

    // =========================================================================
    // LEVEL 2 / PHASE 2 / RED STAR
    // =========================================================================
    
    // COMMON - Level 2 Fundamental (Mandatory)
    ..._buildCommonLevel2(),

    // SEA SPECIFIC - Phase 2
    ..._buildSeaLevel2(),

    // ARMY SPECIFIC - Red Star
    ..._buildArmyLevel2(),

    // AIR SPECIFIC - Level 2
    ..._buildAirLevel2(),

    // =========================================================================
    // LEVEL 3 / PHASE 3 / SILVER STAR
    // =========================================================================
    
    // COMMON - Level 3 Fundamental (Mandatory)
    ..._buildCommonLevel3(),

    // SEA SPECIFIC - Phase 3
    ..._buildSeaLevel3(),

    // ARMY SPECIFIC - Silver Star
    ..._buildArmyLevel3(),

    // AIR SPECIFIC - Level 3
    ..._buildAirLevel3(),

    // =========================================================================
    // LEVEL 4 / PHASE 4 / GOLD STAR
    // =========================================================================
    
    // COMMON - Level 4 Fundamental (Mandatory)
    ..._buildCommonLevel4(),

    // SEA SPECIFIC - Phase 4
    ..._buildSeaLevel4(),

    // ARMY SPECIFIC - Gold Star
    ..._buildArmyLevel4(),

    // AIR SPECIFIC - Level 4
    ..._buildAirLevel4(),

    // =========================================================================
    // OPTIONAL / CORPS ACTIVITIES
    // =========================================================================
    ..._buildOptionalActivities(),
  ];

  static List<Lesson> getLessonsForPhase(Phase phase, {CadetElement element = CadetElement.sea}) {
    return allLessons.where((l) => l.phase == phase && l.elements.contains(element)).toList();
  }

  // =========================================================================
  // HELPER BUILDERS (To keep the list manageable)
  // =========================================================================

  static List<Lesson> _buildCommonLevel1() {
    const p = Phase.level1;
    return [
      const Lesson(code: 'M100', title: 'PHASE', phase: p, periods: 6, isMandatory: true),
      const Lesson(code: 'MX01.01', title: 'Citizenship Activities', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX02.01', title: 'Community Service', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M103.01', title: 'Responsibilities of a Follower', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M103.03', title: 'Team building Activities', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'MX04.01', title: '60 Minutes of MVPA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX04.02', title: 'Cadet Fitness Assessment (CFA)', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX05.01', title: 'Physical Activities', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M106.01', title: 'Parts and Characteristics of the Daisy 853C', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M106.02', title: 'Safety Precautions on the Cadet Air Rifle', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M106.04', title: 'Rules and Commands on an Air Rifle Range', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M107.01', title: 'Discuss Year One Training', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M107.03', title: 'Rules and Procedures for Paying Compliments', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.01', title: 'Positions of Attention, Stand at Ease, and Stand Easy', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.02', title: 'Execute a Salute at the Halt', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.03', title: 'Turns at the Halt', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.04', title: 'Close to the Right and Left', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.05', title: 'Paces Forward and to the Rear', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.06', title: 'Movements Required for a Right Dress', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.07', title: 'Open Order and Close Order March', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.08', title: 'March and Halt in Quick Time', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.09', title: 'Marking Time, Forward, and Halting', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.11', title: 'Pay Compliments with a Squad on the March', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M108.12', title: 'Drill Movements During ACR', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX20.01', title: 'CAF Engagement Activity', phase: p, periods: 9, isMandatory: true),
      // Complementary
      const Lesson(code: 'CX01.01', title: 'Citizenship Activities', phase: p, periods: 18),
      const Lesson(code: 'CX02.01', title: 'Community Service', phase: p, periods: 18),
      const Lesson(code: 'M103.02', title: 'Map Personal Goals', phase: p, periods: 1),
      const Lesson(code: 'C103.01', title: 'Icebreaker Activities', phase: p, periods: 1),
      const Lesson(code: 'C103.02', title: 'Self-Introductions', phase: p, periods: 1),
      const Lesson(code: 'C103.03', title: 'Team building Activities', phase: p, periods: 1),
      const Lesson(code: 'MX04.03', title: 'Participate in the CFA', phase: p, periods: 3),
      const Lesson(code: 'CX04.01', title: 'CFA and Improvement Strategies', phase: p, periods: 3),
      const Lesson(code: 'CX04.02', title: 'Activities for Physical Fitness', phase: p, periods: 3),
      const Lesson(code: 'CX04.03', title: 'Cooking Class', phase: p, periods: 3),
      const Lesson(code: 'CX04.04', title: 'Healthy Living Presentation', phase: p, periods: 3),
      const Lesson(code: 'CX04.05', title: 'Local Amateur Sporting Event', phase: p, periods: 3),
      const Lesson(code: 'CX05.01', title: 'Physical Activities', phase: p, periods: 9),
      const Lesson(code: 'CX05.02', title: 'Tournament', phase: p, periods: 9),
      const Lesson(code: 'M106.03', title: 'Basic Marksmanship Techniques', phase: p, periods: 2),
      const Lesson(code: 'M106.05', title: 'Marksmanship Familiarization', phase: p, periods: 3),
      const Lesson(code: 'C106.01', title: 'Recreational Marksmanship', phase: p, periods: 3),
      const Lesson(code: 'C106.02', title: 'Clean and Store the Cadet Air Rifle', phase: p, periods: 1),
      const Lesson(code: 'M107.06', title: 'Summer Training Opportunities', phase: p, periods: 1),
      const Lesson(code: 'M108.10', title: 'Execute a Salute on the March', phase: p, periods: 1),
      const Lesson(code: 'C108.01', title: 'Supplementary Drill Movements', phase: p, periods: 6),
      const Lesson(code: 'C108.02', title: 'Drill Competition', phase: p, periods: 3),
      const Lesson(code: 'C111.01', title: 'Biathlon Briefing', phase: p, periods: 1),
      const Lesson(code: 'C111.02', title: 'Run Wind Sprints', phase: p, periods: 1),
      const Lesson(code: 'C111.03', title: 'Simulate Firing Following Activity', phase: p, periods: 1),
      const Lesson(code: 'C111.04', title: 'Recreational Summer Biathlon', phase: p, periods: 6),
      const Lesson(code: 'CX20.01', title: 'CAF Familiarization Activities', phase: p, periods: 18),
      const Lesson(code: 'ACR', title: 'Annual Ceremonial Review', phase: p, periods: 3),
    ];
  }

  static List<Lesson> _buildSeaLevel1() {
    const p = Phase.level1;
    const e = [CadetElement.sea];
    return [
      const Lesson(code: 'M107.02', title: 'Sea Cadet and Naval Officer Ranks', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M107.04', title: 'Motto and History of the Sea Cadet Program', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M107.05', title: 'Wear the Sea Cadet Uniform', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M121.01', title: 'Tie Knots, Bends and Hitches', phase: p, periods: 6, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.02', title: 'Whipping a Line', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.03', title: 'Coil and Heave a Line', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M123.01', title: 'Define Basic Naval Terminology', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M123.02', title: 'Identify Pipes and Correct Responses', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M123.03', title: 'Ship\'s Operations', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M124.01', title: 'Prepare for a Sail Weekend', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'C125.01', title: 'Prepare for a Nautical Weekend', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C125.02', title: 'Participate in a Nautical Weekend', phase: p, periods: 9, category: 'Elemental', elements: e),
      const Lesson(code: 'C107.01', title: 'Maintain the Sea Cadet Uniform', phase: p, periods: 2, elements: e),
      const Lesson(code: 'C107.02', title: 'Tour of the Corps', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C107.03', title: 'History of the Corps', phase: p, periods: 1, elements: e),
    ];
  }

  static List<Lesson> _buildArmyLevel1() {
    const p = Phase.level1;
    const e = [CadetElement.army];
    return [
      const Lesson(code: 'M107.02', title: 'Army Cadet and Officer Ranks', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M107.04', title: 'Aims and Motto of the Army Cadet Program', phase: p, periods: 2, isMandatory: true, elements: e),
      const Lesson(code: 'M107.05', title: 'Wear the Army Cadet Uniform', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M121.01', title: 'Select Personal Equipment', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.02', title: 'Transport Personal Equipment', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.03', title: 'Tie Knots and Lashings', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.07', title: 'Erect a Group Tent', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.08', title: 'Leave No Trace Camping', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.09', title: 'Follow Camp Routine', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M122.01', title: 'Types of Maps', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M122.02', title: 'Marginal Information and Conventional Signs', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M122.03', title: 'Interpret Contour Lines', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M122.04', title: 'Orient a Map by Inspection', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M122.05', title: 'Determine a Grid Reference', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M123.01', title: 'Select Hiking Clothing and Equipment', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M123.02', title: 'Participate in a Day Hike', phase: p, periods: 9, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.04', title: 'Assemble a Survival Kit', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.05', title: 'Recognize Environmental Hazards', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M121.06', title: 'Identify Environmental Injuries', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C121.01', title: 'Construct Field Amenities', phase: p, periods: 4, category: 'Elemental', elements: e),
      const Lesson(code: 'C121.02', title: 'Discussion on Cold Climate Exposure', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C121.03', title: 'Select Cold Weather Clothing', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C121.04', title: 'Effects of Cold Weather', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C121.05', title: 'Cold Weather Training', phase: p, periods: 18, category: 'Elemental', elements: e),
      const Lesson(code: 'M122.CA', title: 'Follow a Route Led by Section Commander', phase: p, periods: 9, category: 'Elemental', elements: e),
      const Lesson(code: 'C122.01', title: 'Practice Navigation as a Team', phase: p, periods: 12, category: 'Elemental', elements: e),
      const Lesson(code: 'C123.01', title: 'Adventure Training', phase: p, periods: 18, category: 'Elemental', elements: e),
      const Lesson(code: 'C123.02', title: 'Snowshoe March Discipline', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C123.03', title: 'Snowshoeing Hike', phase: p, periods: 9, category: 'Elemental', elements: e),
      const Lesson(code: 'C107.01', title: 'Maintain the Army Cadet Uniform', phase: p, periods: 3, elements: e),
      const Lesson(code: 'C107.02', title: 'Tour of the Cadet Corps', phase: p, periods: 3, elements: e),
      const Lesson(code: 'C107.03', title: 'History of the Cadet Corps', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C107.04', title: 'Full Value Contract', phase: p, periods: 1, elements: e),
    ];
  }

  static List<Lesson> _buildAirLevel1() {
    const p = Phase.level1;
    const e = [CadetElement.air];
    return [
      const Lesson(code: 'M107.02', title: 'Air Cadet and RCAF Officer Ranks', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M107.04', title: 'Aim and Motto of the Air Cadet Program', phase: p, periods: 1, isMandatory: true, elements: e),
      const Lesson(code: 'M107.05', title: 'Wear the Air Cadet Uniform', phase: p, periods: 2, isMandatory: true, elements: e),
      const Lesson(code: 'M121.01', title: 'Discuss Aviation Opportunities', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M129.01', title: 'Recite Phonetic Alphabet and Numbers', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M130.01', title: 'Identify Aircraft Military, Civilian and Cadet', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M130.02', title: 'Main Components of an Airplane', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M130.03', title: 'Construct a Model Airplane', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M140.01', title: 'Launch a Water Rocket', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M160.01', title: 'Identify Major Aerodrome Components', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M160.02', title: 'Features of a Runway', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M160.03', title: 'Construct a Model Aerodrome', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.01', title: 'Pack Personal Equipment for Field', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.02', title: 'Personal Equipment and Hygiene in Field', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.03', title: 'Observe Site Policies and Procedures', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.04', title: 'Survival Psychology', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.05', title: 'Identify Types of Shelters', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.07', title: 'Erect, Tear Down and Pack Tents', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.02', title: 'Tie Knots and Lashings', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'C121.01', title: 'Canadian Aviation Industry Presentation', phase: p, periods: 8, category: 'Elemental', elements: e),
      const Lesson(code: 'M130.04', title: 'Watch On Canadian Wings Video', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C130.01', title: 'Walk-Around Aircraft Inspection', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C130.02', title: 'Identify International Aircraft', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C130.03', title: 'Watch On Canadian Wings Video', phase: p, periods: 8, category: 'Elemental', elements: e),
      const Lesson(code: 'C130.04', title: 'Tour Aviation Museum', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C130.05', title: 'Attend Air Show', phase: p, periods: 6, category: 'Elemental', elements: e),
      const Lesson(code: 'C140.01', title: 'Launch a Foam Rocket', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C140.02', title: 'Sleep Patterns in Space', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C160.01', title: 'Tour Aerodrome', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C170.01', title: 'How It\'s Made Segments', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C170.02', title: 'Tour Aviation Maintenance Facility', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'M190.06', title: 'Light, Maintain and Extinguish a Fire', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.01', title: 'SAR Community Presentation', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.03', title: 'Construct a Hootchie-Style Shelter', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.04', title: 'Collect Drinking Water in the Field', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.05', title: 'Identify Environmental Injuries', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.06', title: 'Respect Environment in the Field', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C190.07', title: 'Habitats of Animals and Insects', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C107.01', title: 'Maintain the Air Cadet Uniform', phase: p, periods: 2, elements: e),
      const Lesson(code: 'C107.02', title: 'Identify RCAF NCM Rank Structure', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C107.03', title: 'Tour the Squadron', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C107.04', title: 'History of the Squadron', phase: p, periods: 2, elements: e),
    ];
  }

  static List<Lesson> _buildCommonLevel2() {
    const p = Phase.level2;
    return [
      const Lesson(code: 'M200', title: 'PHASE', phase: p, periods: 6, isMandatory: true),
      const Lesson(code: 'MX01.01', title: 'Citizenship Activities', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX02.01', title: 'Community Service', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M203.01', title: 'Leadership Within a Peer Setting', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M203.02', title: 'Principles of Leadership', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M203.03', title: 'Effective Communication', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M203.04', title: 'Positive Group Dynamics', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M203.05', title: 'Influence Behaviours', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M203.06', title: 'Employ Problem Solving', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M203.07', title: 'Personal Integrity', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M203.08', title: 'Team-Building Activities', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'MX04.01', title: '60 Minutes of MVPA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX04.02', title: 'CFA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX05.01', title: 'Physical Activities', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M207.01', title: 'Year Two Training Opportunities', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M207.03', title: 'Role of the Local Sponsor', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M208.01', title: 'Left and Right Turns on the March', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M208.02', title: 'Form Single File From the Halt', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'MX20.01', title: 'CAF Engagement Activity', phase: p, periods: 9, isMandatory: true),
      // Complementary
      const Lesson(code: 'CX01.01', title: 'Citizenship Activities', phase: p, periods: 18),
      const Lesson(code: 'CX02.01', title: 'Community Service', phase: p, periods: 18),
      const Lesson(code: 'C203.01', title: 'Reflective Journal Entries', phase: p, periods: 3),
      const Lesson(code: 'C203.02', title: 'Employ Problem Solving', phase: p, periods: 2),
      const Lesson(code: 'C203.03', title: 'Characteristics of a Leader', phase: p, periods: 2),
      const Lesson(code: 'C203.04', title: 'Leader Presentation', phase: p, periods: 2),
      const Lesson(code: 'C203.05', title: 'Trust-Building Activities', phase: p, periods: 1),
      const Lesson(code: 'C203.06', title: 'Problem-Solving Activities', phase: p, periods: 2),
      const Lesson(code: 'MX04.03', title: 'Participate in the CFA', phase: p, periods: 3),
      const Lesson(code: 'CX04.01', title: 'CFA and Improvement Strategies', phase: p, periods: 3),
      const Lesson(code: 'CX04.02', title: 'Activities for Physical Fitness', phase: p, periods: 3),
      const Lesson(code: 'CX04.03', title: 'Cooking Class', phase: p, periods: 3),
      const Lesson(code: 'CX04.04', title: 'Healthy Living Presentation', phase: p, periods: 3),
      const Lesson(code: 'CX04.05', title: 'Local Amateur Sporting Event', phase: p, periods: 3),
      const Lesson(code: 'CX05.01', title: 'Physical Activities', phase: p, periods: 9),
      const Lesson(code: 'CX05.02', title: 'Tournament', phase: p, periods: 9),
      const Lesson(code: 'M206.01', title: 'Recreational Marksmanship', phase: p, periods: 3),
      const Lesson(code: 'C206.01', title: 'Practice Holding Techniques', phase: p, periods: 1),
      const Lesson(code: 'C206.02', title: 'Practice Aiming Techniques', phase: p, periods: 2),
      const Lesson(code: 'C206.03', title: 'Practice Firing Techniques', phase: p, periods: 1),
      const Lesson(code: 'C208.01', title: 'Ceremonial Drill Review', phase: p, periods: 2),
      const Lesson(code: 'C208.02', title: 'Drill With Arms', phase: p, periods: 8),
      const Lesson(code: 'C108.01', title: 'Supplementary Drill Movements', phase: p, periods: 6),
      const Lesson(code: 'C211.01', title: 'Civilian Biathlon Opportunities', phase: p, periods: 1),
      const Lesson(code: 'C211.02', title: 'Run on Alternate Terrain', phase: p, periods: 1),
      const Lesson(code: 'C211.03', title: 'Fire with Sling Following Activity', phase: p, periods: 1),
      const Lesson(code: 'C211.04', title: 'Competitive Summer Biathlon', phase: p, periods: 6),
      const Lesson(code: 'CX20.01', title: 'CAF Familiarization Activities', phase: p, periods: 18),
      const Lesson(code: 'ACR', title: 'Annual Ceremonial Review', phase: p, periods: 3),
    ];
  }

  static List<Lesson> _buildSeaLevel2() {
    const p = Phase.level2;
    const e = [CadetElement.sea];
    return [
      const Lesson(code: 'M221.01', title: 'Use a Strop for Slinging', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.03', title: 'Reeve a Block', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.04', title: 'Components of Tackles', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.05', title: 'Rig Tackles', phase: p, periods: 6, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.01', title: 'Define Ship-Related Terms', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.02', title: 'The Watch System', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.03', title: 'Notes Using the Boatswain\'s Call', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.04', title: 'Pipe the General Call', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.05', title: 'Pipe the Still', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.06', title: 'Pipe the Carry On', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'MX24.01', title: 'Prepare for a Sail Weekend', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'CX25.01', title: 'Prepare for a Nautical Weekend', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'CX25.02', title: 'Nautical Training Weekend', phase: p, periods: 9, category: 'Elemental', elements: e),
      const Lesson(code: 'M207.02', title: 'Historical Aspects of Sea Cadets', phase: p, periods: 1, elements: e),
      const Lesson(code: 'M207.04', title: 'Identify Year Two CSTC Opportunities', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.01', title: 'Identify Rank Structure of Army/Air Cadets', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.02', title: 'Visit a Local Cadet Corps or Squadron', phase: p, periods: 3, elements: e),
      const Lesson(code: 'C207.03', title: 'Describe the Affiliated Unit', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.04', title: 'Tour of the Affiliated Unit', phase: p, periods: 3, elements: e),
    ];
  }

  static List<Lesson> _buildArmyLevel2() {
    const p = Phase.level2;
    const e = [CadetElement.army];
    return [
      const Lesson(code: 'M221.01', title: 'Duties of a Section Member', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.02', title: 'Identify Section Equipment', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.06', title: 'Construct a Hoochie Shelter', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.07', title: 'Use Section Equipment', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.08', title: 'Prepare an IMP', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.09', title: 'Maintain Section Equipment Post-FTX', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M222.02', title: 'Describe Bearings', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M222.03', title: 'Compass Parts', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M222.04', title: 'Distance Along a Route', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M222.05', title: 'Orient a Map Using a Compass', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M222.06', title: 'Follow a Magnetic Bearing Point to Point', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.01', title: 'Prepare for Trekking', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M224.01', title: 'Actions When Lost', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M224.02', title: 'Seven Enemies of Survival', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M224.04', title: 'Emergency Shelters', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.03', title: 'Provincial/Territorial Wildlife', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.04', title: 'Basic First Aid', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M221.05', title: 'Tie Knots', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C221.01', title: 'Wilderness Conservation Presentation', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C221.02', title: 'Construct Field Amenities', phase: p, periods: 6, category: 'Elemental', elements: e),
      const Lesson(code: 'C221.03', title: 'Species of Trees', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M222.01', title: 'Review Green Star Navigation', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C222.01', title: 'Practice Navigation Map and Compass', phase: p, periods: 9, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.02', title: 'Hiking/Trekking Associations', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M223.03', title: 'Crossing Obstacles While Trekking', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M224.03', title: 'Predict Weather Cloud Formations', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M224.05', title: 'Fire Maintenance and Extinction', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'M224.06', title: 'Methods of Signaling', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C224.01', title: 'Cook in the Field', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C224.02', title: 'Signal Fire Preparation', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M207.02', title: 'History of Army Cadets', phase: p, periods: 1, elements: e),
      const Lesson(code: 'M207.04', title: 'Year Two CSTC Opportunities', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.01', title: 'Rank Structure of Sea and Air Cadets', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.02', title: 'Visit Local Corps or Squadron', phase: p, periods: 3, elements: e),
      const Lesson(code: 'C107.03', title: 'Activity on History of Cadet Corps', phase: p, periods: 2, elements: e),
    ];
  }

  static List<Lesson> _buildAirLevel2() {
    const p = Phase.level2;
    const e = [CadetElement.air];
    return [
      const Lesson(code: 'M231.01', title: 'Four Forces Acting Upon Aircraft', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M231.02', title: 'Production of Lift by Wing', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M231.03', title: 'Types of Drag Acting Upon Aircraft', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M231.04', title: 'Axial Movements of Aircraft', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M231.05', title: 'Aircraft Control Surfaces', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M232.01', title: 'Types of Aircraft Engines', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M240.01', title: 'Advancements in Aerospace Technology', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M260.01', title: 'Aspects of Air Traffic Control', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M260.02', title: 'Basic Aerodrome Operations', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M290.01', title: 'Construct Signal Fire', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M290.02', title: 'Construct Lean-to-Style Shelter', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M290.03', title: 'Construct Simple Snare', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M290.04', title: 'Construct Ground-to-Air Signals', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M290.05', title: 'Hiking Techniques', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M290.06', title: 'Operate Hand-Held Radio', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M230.01', title: 'Aircraft Flown During WWI and WWII', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M230.02', title: '20th Century Canadian Military History', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C230.01', title: 'Memory Project Speakers Bureau Presentation', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C230.02', title: 'Tour Local Aviation Museum', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C231.01', title: 'Operate Experimental Wing', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C231.02', title: 'Fly Paper Colditz Glider', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C231.03', title: 'Tour Flight School', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'M232.02', title: 'Components of Piston Engines', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M232.03', title: 'Four-Stroke Engine Cycles', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M232.04', title: 'Functions of Oil in Piston Engine', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M240.02', title: 'Invent Space Technology Item', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M240.03', title: 'Space Survival Scenario', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'C240.04', title: 'Navigate with GPS', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C260.01', title: 'Tour Aerodrome Security Facility', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C260.02', title: 'Tour ATC Tower', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'M270.01', title: 'Aspects of Aircraft Manufacturing', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M270.02', title: 'Aircraft Maintenance Requirements', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M270.03', title: 'Aircraft Manufacturing Careers', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C270.03', title: 'Tour Aircraft Manufacturing Facility', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C290.03', title: 'Construct Snow Cave', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C290.05', title: 'Participate in a Hike', phase: p, periods: 6, category: 'Elemental', elements: e),
      const Lesson(code: 'M207.02', title: 'History of RCAC', phase: p, periods: 1, elements: e),
      const Lesson(code: 'M207.04', title: 'Year Two CSTC Opportunities', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.01', title: 'Rank Structure of Sea and Army Cadets', phase: p, periods: 1, elements: e),
      const Lesson(code: 'C207.02', title: 'Visit Local Corps or Squadron', phase: p, periods: 3, elements: e),
    ];
  }

  static List<Lesson> _buildCommonLevel3() {
    const p = Phase.level3;
    return [
      const Lesson(code: 'M300', title: 'PHASE', phase: p, periods: 6, isMandatory: true),
      const Lesson(code: 'MX01.01', title: 'Citizenship Activities', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX02.01', title: 'Community Service', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M303.01', title: 'Role of a Team Leader', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M303.02', title: 'Participate in Mentoring', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M303.03', title: 'Practice Self-Assessment', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M303.04', title: 'Communicate as a Team Leader', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M303.05', title: 'Supervise Cadets', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M303.06', title: 'Solve Problems', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M303.07', title: 'Leadership Assignment', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'MX04.01', title: '60 Minutes of MVPA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX04.02', title: 'CFA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX05.01', title: 'Physical Activities', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M307.01', title: 'Year Three Training Opportunities', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M308.01', title: 'Prepare a Squad for Parade', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'M308.02', title: 'Deliver Words of Command', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M309.01', title: 'Principles of Instruction', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M309.02', title: 'Methods of Instruction', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M309.03', title: 'Effective Speaking Techniques', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M309.04', title: 'Questioning Techniques', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M309.05', title: 'Appropriate Instructional Aids', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M309.06', title: 'Plan a Lesson', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M309.07', title: 'Instruct a 15-Minute Lesson', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX20.01', title: 'CAF Engagement Activity', phase: p, periods: 9, isMandatory: true),
      // Complementary
      const Lesson(code: 'C303.01', title: 'Lead Team-Building Activities', phase: p, periods: 3),
      const Lesson(code: 'C303.02', title: 'Leader Presentation', phase: p, periods: 2),
      const Lesson(code: 'M306.01', title: 'Recreational Marksmanship', phase: p, periods: 3),
      const Lesson(code: 'C306.01', title: 'Civilian Marksmanship Organizations', phase: p, periods: 1),
      const Lesson(code: 'C306.02', title: 'Correct Marksmanship Error', phase: p, periods: 2),
      const Lesson(code: 'C306.03', title: 'Standing Marksmanship Position', phase: p, periods: 2),
      const Lesson(code: 'C308.01', title: 'Execute Flag Party Drill', phase: p, periods: 4),
      const Lesson(code: 'C308.02', title: 'Deliver Words of Command', phase: p, periods: 2),
      const Lesson(code: 'C309.01', title: 'One-Minute Verbal Presentation', phase: p, periods: 2),
      const Lesson(code: 'C309.02', title: 'Plan a Lesson', phase: p, periods: 2),
      const Lesson(code: 'C309.03', title: 'Instruct a 15-Minute Lesson', phase: p, periods: 3),
      const Lesson(code: 'C309.04', title: 'Formations for Drill Instruction', phase: p, periods: 1),
      const Lesson(code: 'C309.05', title: 'Plan a Drill Lesson', phase: p, periods: 2),
      const Lesson(code: 'C309.06', title: 'Instruct a 15-Minute Drill Lesson', phase: p, periods: 3),
      const Lesson(code: 'C311.01', title: 'Aiming and Firing Post-Activity', phase: p, periods: 3),
      const Lesson(code: 'C311.02', title: 'Recreational Summer Biathlon', phase: p, periods: 6),
      const Lesson(code: 'ACR', title: 'Annual Ceremonial Review', phase: p, periods: 3),
    ];
  }

  static List<Lesson> _buildSeaLevel3() {
    const p = Phase.level3;
    const e = [CadetElement.sea];
    return [
      const Lesson(code: 'PO 322', title: 'PCOC Certification', phase: p, periods: 15, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M323.01', title: 'Perform Corps Duties', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M321.01', title: 'Safety for Lifting Devices', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M321.02', title: 'Rig Sheers', phase: p, periods: 5, category: 'Elemental', elements: e),
      const Lesson(code: 'C321.02', title: 'Rig Standing Derrick', phase: p, periods: 6, category: 'Elemental', elements: e),
      const Lesson(code: 'C321.03', title: 'Rig a Gyn', phase: p, periods: 6, category: 'Elemental', elements: e),
      const Lesson(code: 'C323.01', title: 'Communicate Using Flags', phase: p, periods: 4, category: 'Elemental', elements: e),
      const Lesson(code: 'C323.02', title: 'Pipe Wakey Wakey', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M307.03', title: 'Navy League and DND Partnership', phase: p, periods: 1, elements: e),
    ];
  }

  static List<Lesson> _buildArmyLevel3() {
    const p = Phase.level3;
    const e = [CadetElement.army];
    return [
      const Lesson(code: 'M321.01', title: 'Duties of Team Leader in Field', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M321.02', title: 'Construct Bivouac Components', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M322.02', title: 'Calculate Magnetic Declination', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M324.01', title: 'Construct Improvised Shelter', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M324.05', title: 'Determine When to Self-Rescue', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M325.01', title: 'Army Cadet Expedition Training', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M322.03', title: 'Components of GPS', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M322.06', title: 'Location Using GPS Receiver', phase: p, periods: 4, category: 'Elemental', elements: e),
      const Lesson(code: 'M324.03', title: 'Fire Without Matches', phase: p, periods: 4, category: 'Elemental', elements: e),
      const Lesson(code: 'M325.02', title: 'Competencies of Outdoor Leader', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'M326.02', title: 'Canoe/Bike/Hike Expedition', phase: p, periods: 6, category: 'Elemental', elements: e),
      const Lesson(code: 'M307.03', title: 'Army Cadet League and DND Partnership', phase: p, periods: 1, elements: e),
    ];
  }

  static List<Lesson> _buildAirLevel3() {
    const p = Phase.level3;
    const e = [CadetElement.air];
    return [
      const Lesson(code: 'M336.01', title: 'Properties of Atmosphere', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M336.02', title: 'Formation of Clouds', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M340.01', title: 'Identify Canadian Astronauts', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M390.01', title: 'Parts of the Compass', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M390.02', title: 'Marginal Information and Signs', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M390.03', title: 'Determine Grid References', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M390.04', title: 'Distance on Map and Ground', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M390.05', title: 'Bearings on Map and Ground', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M331.01', title: 'Aircraft Stability', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C331.04', title: 'Flight Simulator Movements', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'M336.04', title: 'Humidity and Temperature on Weather', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C337.01', title: 'Radio for Aviation Transmission', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M340.02', title: 'History of Manned Space Exploration', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M370.02', title: 'Aircraft Manufacturers', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M370.03', title: 'Routine Aircraft Inspection', phase: p, periods: 1, category: 'Elemental', elements: e),
      const Lesson(code: 'M307.03', title: 'Air Cadet League and DND Partnership', phase: p, periods: 1, elements: e),
    ];
  }

  static List<Lesson> _buildCommonLevel4() {
    const p = Phase.level4;
    return [
      const Lesson(code: 'M400', title: 'PHASE', phase: p, periods: 6, isMandatory: true),
      const Lesson(code: 'MX01.01', title: 'Citizenship Activities', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX02.01', title: 'Community Service', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M403.01', title: 'Needs and Expectations of Team Members', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M403.02', title: 'Select a Leadership Approach', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M403.03', title: 'Motivate Team Members', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M403.04', title: 'Feedback to Team Members', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M403.05', title: 'Mentoring Relationship', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M403.06', title: 'Team Leader During Appointment', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'MX04.01', title: '60 Minutes of MVPA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX04.02', title: 'CFA', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX05.01', title: 'Physical Activities', phase: p, periods: 9, isMandatory: true),
      const Lesson(code: 'M407.01', title: 'Year Four Training Opportunities', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M408.01', title: 'Commanding a Division/Flight/Platoon', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M408.02', title: 'Parade Sequence', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M408.03', title: 'Command a Squad', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M408.04', title: 'Inspect a Cadet on Parade', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M409.01', title: 'Methods of Instruction', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M409.02', title: 'Positive Learning Environment', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M409.03', title: 'Learner Needs', phase: p, periods: 2, isMandatory: true),
      const Lesson(code: 'M409.04', title: 'Explain Assessment', phase: p, periods: 1, isMandatory: true),
      const Lesson(code: 'M409.05', title: 'Instruct a 30-Minute Lesson', phase: p, periods: 3, isMandatory: true),
      const Lesson(code: 'MX20.01', title: 'CAF Engagement Activity', phase: p, periods: 9, isMandatory: true),
      // Complementary
      const Lesson(code: 'C403.01', title: 'Leadership Seminar', phase: p, periods: 12),
      const Lesson(code: 'M406.01', title: 'Recreational Marksmanship', phase: p, periods: 3),
      const Lesson(code: 'C406.01', title: 'Assist the RSO', phase: p, periods: 1),
      const Lesson(code: 'C406.02', title: 'Score Air Rifle Targets', phase: p, periods: 1),
      const Lesson(code: 'C408.01', title: 'History of Drill', phase: p, periods: 1),
      const Lesson(code: 'C408.02', title: 'View Drill Re-Enactment', phase: p, periods: 3),
      const Lesson(code: 'C409.01', title: 'Plan a Lesson', phase: p, periods: 2),
      const Lesson(code: 'C409.02', title: 'Instruct a 30-Minute Lesson', phase: p, periods: 3),
      const Lesson(code: 'C409.03', title: 'Assistant Instructor', phase: p, periods: 3),
      const Lesson(code: 'C409.05', title: 'Assistant Drill Instructor', phase: p, periods: 3),
      const Lesson(code: 'C409.06', title: 'Instruct a 30-Minute Drill Lesson', phase: p, periods: 3),
      const Lesson(code: 'ACR', title: 'Annual Ceremonial Review', phase: p, periods: 3),
    ];
  }

  static List<Lesson> _buildSeaLevel4() {
    const p = Phase.level4;
    const e = [CadetElement.sea];
    return [
      const Lesson(code: 'ROC-M', title: 'Radio Operator Certificate', phase: p, periods: 16, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M423.01', title: 'Aspects of a Chart', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M423.02', title: 'Use Navigation Instruments', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M423.03', title: 'Latitude and Longitude', phase: p, periods: 4, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M423.04', title: 'Plot a Fix', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'C421.01', title: 'Boatswain\'s Belt', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C421.02', title: 'Round Mat', phase: p, periods: 3, category: 'Elemental', elements: e),
      const Lesson(code: 'C423.01', title: 'Three-Bearing Fix', phase: p, periods: 2, category: 'Elemental', elements: e),
    ];
  }

  static List<Lesson> _buildArmyLevel4() {
    const p = Phase.level4;
    const e = [CadetElement.army];
    return [
      const Lesson(code: 'M422.02', title: 'Multi-Leg Route Using GPS', phase: p, periods: 4, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M422.03', title: 'Follow Multi-Leg Route Using GPS', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M424.01', title: 'Sharpen Survival Knife', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M424.02', title: 'Employ Improvising Process', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M424.03', title: 'Weave Cordage', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M425.01', title: 'Establish Expedition Parameters', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M425.02', title: 'Plan an Expedition Route', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M425.03', title: 'Expedition Equipment List', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M425.04', title: 'Expedition Ration Plan', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M426.01', title: 'Prepare for Expedition Training', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M426.02', title: 'Canoe/Bike/Hike/Ski Expedition', phase: p, periods: 9, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'C422.05', title: 'Location Using Resection', phase: p, periods: 2, category: 'Elemental', elements: e),
    ];
  }

  static List<Lesson> _buildAirLevel4() {
    const p = Phase.level4;
    const e = [CadetElement.air];
    return [
      const Lesson(code: 'M490.01', title: 'Assemble Emergency Survival Kit', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M490.02', title: 'Operate Stove and Lantern', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M490.03', title: 'Tie Knots and Lashings', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M431.01', title: 'Features of Wing Design', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M431.02', title: 'Flight Instruments', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M432.01', title: 'Fuel Systems', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M432.02', title: 'Propeller Systems', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M432.03', title: 'Engine Instruments', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M436.01', title: 'Explain Winds', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M436.02', title: 'Air Masses and Fronts', phase: p, periods: 3, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M437.01', title: 'Air Navigation Terms', phase: p, periods: 2, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M437.02', title: 'Magnetic Compass', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M440.01', title: 'Aerospace Materials', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M440.02', title: 'Canadian Satellites', phase: p, periods: 1, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M490.04', title: 'Waypoint Using GPS', phase: p, periods: 4, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'M490.05', title: 'Fires Using Improvised Ignition', phase: p, periods: 4, isMandatory: true, category: 'Elemental', elements: e),
      const Lesson(code: 'C431.01', title: 'Flight Performance Factors', phase: p, periods: 2, category: 'Elemental', elements: e),
      const Lesson(code: 'C436.03', title: 'Analyze Weather Information', phase: p, periods: 3, category: 'Elemental', elements: e),
    ];
  }

  static List<Lesson> _buildOptionalActivities() {
    return Phase.values.expand((p) => <Lesson>[
      Lesson(code: 'OPT-DRILL-P${p.index + 1}', title: 'Drill Team Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'OPT-MUSIC-P${p.index + 1}', title: 'Music Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'OPT-MARK-P${p.index + 1}', title: 'Marksmanship Practice', phase: p, periods: 20, category: 'Optional'),
      Lesson(code: 'OPT-BIAT-P${p.index + 1}', title: 'Biathlon Practice', phase: p, periods: 10, category: 'Optional'),
      Lesson(code: 'OPT-ORIENT-P${p.index + 1}', title: 'Orienteering Practice', phase: p, periods: 10, category: 'Optional'),
      Lesson(code: 'EVT-HALW-P${p.index + 1}', title: "Hallowe'en Costume Dance", phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-POPPY-P${p.index + 1}', title: 'Poppy Campaign', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-REMB-P${p.index + 1}', title: 'Remembrance Day Visit', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-XMAS-P${p.index + 1}', title: 'Christmas Mess Dinner', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-SANTA-P${p.index + 1}', title: 'Santa Claus Parade', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-SWIM-P${p.index + 1}', title: 'Swimming night', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-MOVIE-P${p.index + 1}', title: 'Movie night', phase: p, periods: 3, category: 'Optional'),
      Lesson(code: 'EVT-BARBQ-P${p.index + 1}', title: 'End-of-Year Barbecue', phase: p, periods: 3, category: 'Optional'),
      // Element specific optional aliases
      Lesson(code: 'EVT-MUSE-SEA-P${p.index + 1}', title: 'Maritime Museum Tour', phase: p, periods: 3, category: 'Optional', elements: [CadetElement.sea]),
      Lesson(code: 'EVT-MUSE-ARMY-P${p.index + 1}', title: 'Military Museum Tour', phase: p, periods: 3, category: 'Optional', elements: [CadetElement.army]),
      Lesson(code: 'EVT-MUSE-AIR-P${p.index + 1}', title: 'Aviation Museum Tour', phase: p, periods: 3, category: 'Optional', elements: [CadetElement.air]),
    ]).toList();
  }
}
