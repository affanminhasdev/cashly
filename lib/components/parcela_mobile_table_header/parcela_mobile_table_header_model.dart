import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'parcela_mobile_table_header_widget.dart'
    show ParcelaMobileTableHeaderWidget;
import 'package:flutter/material.dart';

class ParcelaMobileTableHeaderModel
    extends FlutterFlowModel<ParcelaMobileTableHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PlanoRow>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
