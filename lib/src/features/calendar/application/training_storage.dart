import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/training_session.dart';

class TrainingStorage {
  static const String _key = 'training_data_v1';
  static const String _elementKey = 'selected_cadet_element';

  static Future<void> saveSessions(List<TrainingSession> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = sessions.map((s) => s.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<List<TrainingSession>?> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return null;

    try {
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((j) => TrainingSession.fromJson(j)).toList();
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveElement(CadetElement element) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_elementKey, element.toString());
  }

  static Future<CadetElement> loadElement() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_elementKey);
    if (name == null) return CadetElement.sea;
    
    return CadetElement.values.firstWhere(
      (e) => e.toString() == name || e.name == name,
      orElse: () => CadetElement.sea,
    );
  }
}
