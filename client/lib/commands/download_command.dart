import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:universal_html/html.dart' as html;

import '../models/schedule.dart';
import '../models/snippets.dart';
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

class ExportGridToExcelCommand extends AppCommand {
  Future<void> execute({
    required SfDataGridState state,
    required final Map<String, ContactSnippet> contacts,
  }) async {
    final Workbook workbook = state.exportToExcelWorkbook(
        converter: ScheduleDataGridToExcelConverter(contacts));
    final dataUrl = await encodeToDataUrl(workbook);
    workbook.dispose();
    logMessage(dataUrl);

    if (kIsWeb) {
      downloadDataUrl(dataUrl);
    }
  }

  static encodeToDataUrl(Workbook workbook) async {
    final bytes = await workbook.save();
    final data = base64.encode(bytes);
    return "data:application/octet-stream;charset=utf-16le;base64,$data";
  }

  static downloadDataUrl(String url) {
    final e = html.CustomEvent('download_excel', detail: url);
    html.window.dispatchEvent(e);
  }
}

class ScheduleDataGridToExcelConverter extends DataGridToExcelConverter {
  final Map<String, ContactSnippet> contacts;

  ScheduleDataGridToExcelConverter(this.contacts);

  @override
  Object? getCellValue(DataGridRow row, GridColumn column) {
    final cellValue = super.getCellValue(row, column);

    if (cellValue is Table) {
      final participants = cellValue.participants
          .map((id) => contacts[id])
          .whereNotNull()
          .map((snippet) =>
              '${snippet.personne.displayName} ${snippet.entreprise.entreprise.denomination}')
          .join('\n');
      final ressources = cellValue.ressources.join(', ');
      return 'sujet: $ressources\n$participants';
    }
    return cellValue;
  }
}
