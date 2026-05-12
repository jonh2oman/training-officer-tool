import 'package:uuid/uuid.dart';

class Instructor {
  final String id;
  final String name;
  final String rank;
  final bool isStaff;

  Instructor({
    String? id,
    required this.name,
    required this.rank,
    this.isStaff = false,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rank': rank,
    'isStaff': isStaff,
  };

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json['id'],
    name: json['name'],
    rank: json['rank'],
    isStaff: json['isStaff'] ?? false,
  );

  Instructor copyWith({
    String? name,
    String? rank,
    bool? isStaff,
  }) {
    return Instructor(
      id: id,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      isStaff: isStaff ?? this.isStaff,
    );
  }

  String get displayName => '$rank $name';
}
