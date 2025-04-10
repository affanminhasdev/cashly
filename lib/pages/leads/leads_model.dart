import '/backend/supabase/supabase.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'leads_widget.dart' show LeadsWidget;
import 'package:flutter/material.dart';

class LeadsModel extends FlutterFlowModel<LeadsWidget> {
  ///  Local state fields for this page.

  int? selectedItem;

  ///  State fields for stateful widgets in this page.

  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Model for Menubar component.
  late MenubarModel menubarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Stream<List<KanbanRow>>? rowSupabaseStream;
  Stream<List<LeadRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    menubarModel = createModel(context, () => MenubarModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    menubarModel.dispose();
  }
}
