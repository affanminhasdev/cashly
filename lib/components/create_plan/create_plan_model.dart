import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_plan_widget.dart' show CreatePlanWidget;
import 'package:flutter/material.dart';

class CreatePlanModel extends FlutterFlowModel<CreatePlanWidget> {
  ///  Local state fields for this component.

  DateTime? date;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for pix widget.
  FocusNode? pixFocusNode;
  TextEditingController? pixTextController;
  String? Function(BuildContext, String?)? pixTextControllerValidator;
  // State field(s) for celular widget.
  FocusNode? celularFocusNode;
  TextEditingController? celularTextController;
  String? Function(BuildContext, String?)? celularTextControllerValidator;
  // State field(s) for tipo_device widget.
  String? tipoDeviceValue;
  FormFieldController<String>? tipoDeviceValueController;
  // State field(s) for juros widget.
  FocusNode? jurosFocusNode;
  TextEditingController? jurosTextController;
  String? Function(BuildContext, String?)? jurosTextControllerValidator;
  // State field(s) for parcelas widget.
  FocusNode? parcelasFocusNode;
  TextEditingController? parcelasTextController;
  String? Function(BuildContext, String?)? parcelasTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  String? _textController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  // Stores action output result for [Custom Action - customEnviarPropostaAPI] action in Button widget.
  dynamic customApiResponse;

  @override
  void initState(BuildContext context) {
    textController5Validator = _textController5Validator;
  }

  @override
  void dispose() {
    pixFocusNode?.dispose();
    pixTextController?.dispose();

    celularFocusNode?.dispose();
    celularTextController?.dispose();

    jurosFocusNode?.dispose();
    jurosTextController?.dispose();

    parcelasFocusNode?.dispose();
    parcelasTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
