import 'package:uuid/uuid.dart';

enum SessionType {
  paradeNight,
  trainingDay,
  weekend,
}

enum Phase {
  phase1('Phase 1'),
  phase2('Phase 2'),
  phase3('Phase 3'),
  phase4('Phase 4');

  final String label;
  const Phase(this.label);
}

class LessonSlot {
  final String? eoCode; // e.g. M103.01
  final String? title;
  final String? instructor;
  final String? location;

  const LessonSlot({
    this.eoCode,
    this.title,
    this.instructor,
    this.location,
  });

  bool get isEmpty => eoCode == null && title == null;

  Map<String, dynamic> toJson() => {
    'eoCode': eoCode,
    'title': title,
    'instructor': instructor,
    'location': location,
  };

  factory LessonSlot.fromJson(Map<String, dynamic> json) => LessonSlot(
    eoCode: json['eoCode'],
    title: json['title'],
    instructor: json['instructor'],
    location: json['location'],
  );
}

class TrainingSession {
  final String id;
  final DateTime date;
  final SessionType type;
  final String? description;
  
  // Matrix: Phase -> List of 3 Periods
  final Map<Phase, List<LessonSlot>> matrix;

  TrainingSession({
    String? id,
    required this.date,
    required this.type,
    this.description,
    Map<Phase, List<LessonSlot>>? matrix,
  }) : id = id ?? const Uuid().v4(),
       matrix = matrix ?? {
         for (var phase in Phase.values)
           phase: List.generate(3, (_) => const LessonSlot()),
       };

  TrainingSession copyWith({
    DateTime? date,
    SessionType? type,
    String? description,
    Map<Phase, List<LessonSlot>>? matrix,
  }) {
    return TrainingSession(
      id: id,
      date: date ?? this.date,
      type: type ?? this.type,
      description: description ?? this.description,
      matrix: matrix ?? this.matrix,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'type': type.name,
    'description': description,
    'matrix': matrix.map((key, value) => MapEntry(key.name, value.map((e) => e.toJson()).toList())),
  };

  factory TrainingSession.fromJson(Map<String, dynamic> json) {
    return TrainingSession(
      id: json['id'],
      date: DateTime.parse(json['date']),
      type: SessionType.values.byName(json['type']),
      description: json['description'],
      matrix: (json['matrix'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          Phase.values.byName(key),
          (value as List).map((e) => LessonSlot.fromJson(e)).toList(),
        ),
      ),
    );
  }
}
