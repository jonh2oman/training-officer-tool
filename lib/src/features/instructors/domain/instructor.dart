import 'package:uuid/uuid.dart';

class Instructor {
  final String id;
  final String name;
  final String rank;
  final bool isStaff;
  final List<String> qualifiedEOs;

  Instructor({
    String? id,
    required this.name,
    required this.rank,
    this.isStaff = false,
    this.qualifiedEOs = const [],
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rank': rank,
    'isStaff': isStaff,
    'qualifiedEOs': qualifiedEOs,
  };

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json['id'],
    name: json['name'],
    rank: json['rank'],
    isStaff: json['isStaff'] ?? false,
    qualifiedEOs: List<String>.from(json['qualifiedEOs'] ?? []),
  );

  Instructor copyWith({
    String? name,
    String? rank,
    bool? isStaff,
    List<String>? qualifiedEOs,
  }) {
    return Instructor(
      id: id,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      isStaff: isStaff ?? this.isStaff,
      qualifiedEOs: qualifiedEOs ?? this.qualifiedEOs,
    );
  }

  String get displayName => '$rank $name';

  bool isQualified(String eoCode) => qualifiedEOs.contains(eoCode);
}
