import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'compo_pix_widget.dart' show CompoPixWidget;
import 'package:flutter/material.dart';

class CompoPixModel extends FlutterFlowModel<CompoPixWidget> {
  ///  Local state fields for this component.

  String? savedChavePix;

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
