import 'dart:html' as html;
import 'dart:typed_data';
import 'file_saver.dart';

class FileSaverImpl implements FileSaver {
  @override
  Future<void> saveFile(String fileName, Uint8List bytes) async {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}
