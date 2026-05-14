import 'package:uuid/uuid.dart';

enum SessionType {
  paradeNight,
  trainingDay,
  weekend,
}

enum Phase {
  level1,
  level2,
  level3,
  level4;

  String getLabel(CadetElement element) {
    switch (element) {
      case CadetElement.sea:
        return 'Phase ${index + 1}';
      case CadetElement.army:
        switch (this) {
          case level1: return 'Green Star';
          case level2: return 'Red Star';
          case level3: return 'Silver Star';
          case level4: return 'Gold Star';
        }
      case CadetElement.air:
        return 'Level ${index + 1}';
    }
  }

  // Legacy support for basic label if needed
  String get label => 'Level ${index + 1}';
}

enum CadetElement {
  sea('Sea Cadets'),
  army('Army Cadets'),
  air('Air Cadets');

  final String label;
  const CadetElement(this.label);
}

class LessonSlot {
  final String? eoCode; // e.g. M103.01
  final String? title;
  final String? instructor; // Kept for display/legacy
  final String? instructorId; // Linked to Instructor Registry
  final String? location; // Kept for display/legacy
  final String? locationId; // Linked to Location Registry

  const LessonSlot({
    this.eoCode,
    this.title,
    this.instructor,
    this.instructorId,
    this.location,
    this.locationId,
  });

  bool get isEmpty => eoCode == null && title == null;

  Map<String, dynamic> toJson() => {
    'eoCode': eoCode,
    'title': title,
    'instructor': instructor,
    'instructorId': instructorId,
    'location': location,
    'locationId': locationId,
  };

  factory LessonSlot.fromJson(Map<String, dynamic> json) => LessonSlot(
    eoCode: json['eoCode'],
    title: json['title'],
    instructor: json['instructor'],
    instructorId: json['instructorId'],
    location: json['location'],
    locationId: json['locationId'],
  );
}

class TrainingSession {
  final String id;
  final DateTime date;
  final SessionType type;
  final String? description;
  // Administrative details for Routine Orders
  final String? dutyOfficer;
  final String? dutyNCO;
  final String? dress;
  final String? announcements;
  
  // Matrix: Phase -> List of 3 Periods
  final Map<Phase, List<LessonSlot>> matrix;

  TrainingSession({
    String? id,
    required this.date,
    required this.type,
    this.description,
    this.dutyOfficer,
    this.dutyNCO,
    this.dress,
    this.announcements,
    Map<Phase, List<LessonSlot>>? matrix,
  }) : id = id ?? const Uuid().v4(),
       matrix = _initializeMatrix(type, matrix);

  static Map<Phase, List<LessonSlot>> _initializeMatrix(SessionType type, Map<Phase, List<LessonSlot>>? provided) {
    final targetCount = type == SessionType.paradeNight ? 3 : 9;
    final Map<Phase, List<LessonSlot>> result = {};
    
    for (var phase in Phase.values) {
      final list = provided?[phase] ?? [];
      if (list.length >= targetCount) {
        result[phase] = list.sublist(0, targetCount);
      } else {
        result[phase] = [
          ...list,
          ...List.generate(targetCount - list.length, (_) => const LessonSlot()),
        ];
      }
    }
    return result;
  }

  int get numPeriods => type == SessionType.paradeNight ? 3 : 9;

  bool get isFullyPlanned {
    for (var list in matrix.values) {
      for (var slot in list) {
        if (slot.isEmpty) return false;
      }
    }
    return true;
  }

  TrainingSession copyWith({
    DateTime? date,
    SessionType? type,
    String? description,
    String? dutyOfficer,
    String? dutyNCO,
    String? dress,
    String? announcements,
    Map<Phase, List<LessonSlot>>? matrix,
  }) {
    return TrainingSession(
      id: id,
      date: date ?? this.date,
      type: type ?? this.type,
      description: description ?? this.description,
      dutyOfficer: dutyOfficer ?? this.dutyOfficer,
      dutyNCO: dutyNCO ?? this.dutyNCO,
      dress: dress ?? this.dress,
      announcements: announcements ?? this.announcements,
      matrix: matrix ?? this.matrix,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'type': type.index,
    'description': description,
    'dutyOfficer': dutyOfficer,
    'dutyNCO': dutyNCO,
    'dress': dress,
    'announcements': announcements,
    'matrix': matrix.map((key, value) => MapEntry(key.index.toString(), value.map((e) => e.toJson()).toList())),
  };

  factory TrainingSession.fromJson(Map<String, dynamic> json) {
    // Migration helper for enum values (string to int)
    SessionType parseType(dynamic val) {
      if (val is int && val < SessionType.values.length) return SessionType.values[val];
      return SessionType.values.firstWhere(
        (e) => e.toString().split('.').last == val || e.toString() == val,
        orElse: () => SessionType.paradeNight,
      );
    }

    Phase parsePhase(String key) {
      final val = int.tryParse(key);
      if (val != null && val < Phase.values.length) return Phase.values[val];
      return Phase.values.firstWhere(
        (e) => e.toString().split('.').last == key || e.toString() == key,
        orElse: () => Phase.values.first,
      );
    }

    return TrainingSession(
      id: json['id'],
      date: DateTime.parse(json['date']),
      type: parseType(json['type']),
      description: json['description'],
      dutyOfficer: json['dutyOfficer'],
      dutyNCO: json['dutyNCO'],
      dress: json['dress'],
      announcements: json['announcements'],
      matrix: (json['matrix'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          parsePhase(key),
          (value as List).map((e) => LessonSlot.fromJson(e)).toList(),
        ),
      ),
    );
  }
}
