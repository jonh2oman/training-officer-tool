import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/instructor.dart';

class InstructorStorage {
  static const String _key = 'instructor_data_v1';

  static Future<void> save(List<Instructor> instructors) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = instructors.map((i) => i.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<List<Instructor>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((j) => Instructor.fromJson(j)).toList();
    } catch (e) {
      return [];
    }
  }
}

class InstructorController extends StateNotifier<List<Instructor>> {
  InstructorController() : super([]) {
    _load();
  }

  Future<void> _load() async {
    state = await InstructorStorage.load();
  }

  Future<void> addInstructor(Instructor instructor) async {
    state = [...state, instructor];
    await _save();
  }

  Future<void> updateInstructor(Instructor instructor) async {
    state = [
      for (final i in state)
        if (i.id == instructor.id) instructor else i
    ];
    await _save();
  }

  Future<void> toggleQualification(String instructorId, String eoCode) async {
    state = [
      for (final i in state)
        if (i.id == instructorId)
          i.copyWith(
            qualifiedEOs: i.qualifiedEOs.contains(eoCode)
                ? (List<String>.from(i.qualifiedEOs)..remove(eoCode))
                : (List<String>.from(i.qualifiedEOs)..add(eoCode)),
          )
        else
          i
    ];
    await _save();
  }

  Future<void> deleteInstructor(String id) async {
    state = state.where((i) => i.id != id).toList();
    await _save();
  }

  Future<void> _save() async {
    await InstructorStorage.save(state);
  }
}

final instructorProvider = StateNotifierProvider<InstructorController, List<Instructor>>((ref) {
  return InstructorController();
});
