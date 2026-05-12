import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/location.dart';

class LocationStorage {
  static const String _key = 'location_data_v1';

  static Future<void> save(List<TrainingLocation> locations) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = locations.map((l) => l.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<List<TrainingLocation>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((j) => TrainingLocation.fromJson(j)).toList();
    } catch (e) {
      return [];
    }
  }
}

class LocationController extends StateNotifier<List<TrainingLocation>> {
  LocationController() : super([]) {
    _load();
  }

  Future<void> _load() async {
    state = await LocationStorage.load();
  }

  Future<void> addLocation(TrainingLocation location) async {
    state = [...state, location];
    await _save();
  }

  Future<void> updateLocation(TrainingLocation location) async {
    state = [
      for (final l in state)
        if (l.id == location.id) location else l
    ];
    await _save();
  }

  Future<void> deleteLocation(String id) async {
    state = state.where((l) => l.id != id).toList();
    await _save();
  }

  Future<void> _save() async {
    await LocationStorage.save(state);
  }
}

final locationProvider = StateNotifierProvider<LocationController, List<TrainingLocation>>((ref) {
  return LocationController();
});
