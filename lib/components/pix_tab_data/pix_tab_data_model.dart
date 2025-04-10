import '/backend/supabase/supabase.dart';
import '/components/pix_component/pix_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pix_tab_data_widget.dart' show PixTabDataWidget;
import 'package:flutter/material.dart';

class PixTabDataModel extends FlutterFlowModel<PixTabDataWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in PixTabData widget.
  List<PixRow>? pixQueryResult;
  // Model for PixComponent component.
  late PixComponentModel pixComponentModel;

  @override
  void initState(BuildContext context) {
    pixComponentModel = createModel(context, () => PixComponentModel());
  }

  @override
  void dispose() {
    pixComponentModel.dispose();
  }
}
