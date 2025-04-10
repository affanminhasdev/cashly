import '/backend/supabase/supabase.dart';
import '/components_effects/device_dropdown/device_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'data_table_header_widget.dart' show DataTableHeaderWidget;
import 'package:flutter/material.dart';

class DataTableHeaderModel extends FlutterFlowModel<DataTableHeaderWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - fetchDevices] action in DataTableHeader widget.
  List<DeviceRow>? allDevices;
  Completer<List<CcbRow>>? requestCompleter;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PlanoRow>();
  // Models for DeviceDropdown dynamic component.
  late FlutterFlowDynamicModels<DeviceDropdownModel> deviceDropdownModels;
  // Stores action output result for [Backend Call - Query Rows] action in approve_loan_icon widget.
  List<LeadRow>? leadData;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<PagamentoRow>? instalments;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  bool? response;

  @override
  void initState(BuildContext context) {
    deviceDropdownModels =
        FlutterFlowDynamicModels(() => DeviceDropdownModel());
  }

  @override
  void dispose() {
    paginatedDataTableController.dispose();
    deviceDropdownModels.dispose();
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
