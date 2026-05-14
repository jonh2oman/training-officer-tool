import 'dart:typed_data';
import 'file_saver.dart';
import 'package:file_picker/file_picker.dart';

class FileSaverImpl implements FileSaver {
  @override
  Future<void> saveFile(String fileName, Uint8List bytes) async {
    // For mobile/desktop, use file_picker's saveFile
    await FilePicker.platform.saveFile(
      fileName: fileName,
      bytes: bytes,
    );
  }
}
