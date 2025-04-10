import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'data_table_body_widget.dart' show DataTableBodyWidget;
import 'package:flutter/material.dart';

class DataTableBodyModel extends FlutterFlowModel<DataTableBodyWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  Completer<List<PagamentoRow>>? requestCompleter;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PagamentoRow>();
  // State field(s) for Checkbox widget.
  Map<PagamentoRow, bool> checkboxValueMap1 = {};
  List<PagamentoRow> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<PagamentoRow, bool> checkboxValueMap2 = {};
  List<PagamentoRow> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Delete widget.
  bool? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }

  /// Action blocks.
  Future comenta(BuildContext context) async {
    await PagamentoTable().update(
      data: {
        'comentario': '',
      },
      matchingRows: (rows) => rows,
    );
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
