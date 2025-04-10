import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_payment_line_widget.dart' show CreatePaymentLineWidget;
import 'package:flutter/material.dart';

class CreatePaymentLineModel extends FlutterFlowModel<CreatePaymentLineWidget> {
  ///  Local state fields for this component.

  DateTime? date;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for pix widget.
  FocusNode? pixFocusNode1;
  TextEditingController? pixTextController1;
  String? Function(BuildContext, String?)? pixTextController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for pix widget.
  FocusNode? pixFocusNode2;
  TextEditingController? pixTextController2;
  String? Function(BuildContext, String?)? pixTextController2Validator;
  String? _pixTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    pixTextController2Validator = _pixTextController2Validator;
  }

  @override
  void dispose() {
    pixFocusNode1?.dispose();
    pixTextController1?.dispose();

    pixFocusNode2?.dispose();
    pixTextController2?.dispose();
  }
}
