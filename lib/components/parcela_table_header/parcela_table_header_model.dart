import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'parcela_table_header_widget.dart' show ParcelaTableHeaderWidget;
import 'package:flutter/material.dart';

class ParcelaTableHeaderModel
    extends FlutterFlowModel<ParcelaTableHeaderWidget> {
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
