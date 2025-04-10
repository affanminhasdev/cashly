import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'parcela_mobile_data_table_body_copy_widget.dart'
    show ParcelaMobileDataTableBodyCopyWidget;
import 'package:flutter/material.dart';

class ParcelaMobileDataTableBodyCopyModel
    extends FlutterFlowModel<ParcelaMobileDataTableBodyCopyWidget> {
  ///  Local state fields for this component.

  String? selectedParcela;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PagamentoN8nPostergaRow>();
  Completer<List<PagamentoN8nPostergaRow>>? requestCompleter;

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
