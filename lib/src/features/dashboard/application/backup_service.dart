import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/utils/file_saver_mobile.dart' if (dart.library.html) '../../../shared/utils/file_saver_web.dart';

class BackupService {
  static const List<String> _keys = [
    'training_data_v1',
    'selected_cadet_element',
    'instructor_data_v1',
    'location_data_v1',
    'app_theme_mode',
  ];

  /// Exports all relevant SharedPreferences data to a JSON file.
  /// Returns true if data was found and exported, false if no data was found.
  static Future<bool> exportBackup() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> backupData = {};

    for (final key in _keys) {
      final value = prefs.getString(key);
      if (value != null) {
        backupData[key] = value;
      }
    }

    if (backupData.isEmpty) {
      return false;
    }

    final String jsonString = jsonEncode(backupData);
    final Uint8List bytes = Uint8List.fromList(utf8.encode(jsonString));

    final String timestamp = DateTime.now().toIso8601String().split('T')[0].replaceAll('-', '');
    final fileName = 'training_officer_backup_$timestamp.json';
    
    await FileSaverImpl().saveFile(fileName, bytes);
    return true;
  }

  /// Imports data from a JSON file and updates SharedPreferences.
  /// Returns true if successful.
  static Future<bool> importBackup() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
    );

    if (result == null || result.files.isEmpty) return false;

    final bytes = result.files.first.bytes;
    if (bytes == null) return false;

    try {
      final String jsonString = utf8.decode(bytes);
      final Map<String, dynamic> backupData = jsonDecode(jsonString);

      final prefs = await SharedPreferences.getInstance();
      
      // Basic validation: check if at least one key exists
      bool hasValidData = false;
      for (final key in _keys) {
        if (backupData.containsKey(key)) {
          hasValidData = true;
          break;
        }
      }

      if (!hasValidData) return false;

      // Overwrite local storage
      for (final key in _keys) {
        if (backupData.containsKey(key)) {
          await prefs.setString(key, backupData[key]);
        }
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
