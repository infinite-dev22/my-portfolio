import 'package:universal_html/html.dart' as html;

/// Triggers a file download in the browser.
///
/// [path] is the URL or path to the file.
/// [fileName] is the name the file will have when downloaded.
void downloadFile(String path, String fileName) {
  html.AnchorElement anchorElement = html.AnchorElement(href: path);
  anchorElement.download = fileName;
  anchorElement.click();
}
