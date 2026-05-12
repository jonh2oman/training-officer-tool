import 'package:uuid/uuid.dart';

class TrainingLocation {
  final String id;
  final String name;
  final String? description;

  TrainingLocation({
    String? id,
    required this.name,
    this.description,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };

  factory TrainingLocation.fromJson(Map<String, dynamic> json) => TrainingLocation(
    id: json['id'],
    name: json['name'],
    description: json['description'],
  );

  TrainingLocation copyWith({
    String? name,
    String? description,
  }) {
    return TrainingLocation(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
