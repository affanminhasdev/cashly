import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pix_component_widget.dart' show PixComponentWidget;
import 'package:flutter/material.dart';

class PixComponentModel extends FlutterFlowModel<PixComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DataPix widget.
  final dataPixController = FlutterFlowDataTableController<PixRow>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dataPixController.dispose();
  }
}
