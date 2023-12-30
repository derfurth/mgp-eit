import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:universal_html/html.dart' as html;

import 'commands.dart';

typedef CSV = List<List<dynamic>>;

class DownloadCommand extends AppCommand {
  Future<void> execute({
    required CSV data,
  }) async {
    String csv = const ListToCsvConverter().convert(data);

    final dataUrl = encodeToDataUrl(csv);
    logMessage(dataUrl);

    if (kIsWeb) {
      downloadDataUrl(dataUrl);
    } else {
      logMessage('would download');
      logMessage(csv);
    }
  }

  static encodeToDataUrl(String csv) {
    final bytes = utf8.encode(csv);
    final data = base64.encode(bytes);
    return "data:text/csv;base64,$data";
  }

  static downloadDataUrl(String url) {
    final e = html.CustomEvent('download', detail: url);
    html.window.dispatchEvent(e);
  }
}
