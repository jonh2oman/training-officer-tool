import 'dart:typed_data';

abstract class FileSaver {
  Future<void> saveFile(String fileName, Uint8List bytes);
}
