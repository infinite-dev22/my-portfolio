import 'package:file_saver/file_saver.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Triggers a file download in the browser.
///
/// [path] is the URL or path to the file.
Future<String> downloadFile(String path) async {
  // 1. Load asset bytes efficiently
  final data = await rootBundle.load(path);
  final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  // 2. Trigger native save dialog
  return await FileSaver.instance.saveFile(
    name: 'JONATHAN_MARK_MWIGO_RESUME.pdf', // User-facing filename
    bytes: bytes,
    mimeType: MimeType.pdf,
    fileExtension: 'pdf',
  );
}
