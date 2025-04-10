import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'users_widget.dart' show UsersWidget;
import 'package:flutter/material.dart';

class UsersModel extends FlutterFlowModel<UsersWidget> {
  ///  Local state fields for this page.

  int? selectedUser;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for Menubar component.
  late MenubarModel menubarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? resposta;
  // Stores action output result for [Backend Call - API (Deletar Usuario)] action in Button widget.
  ApiCallResponse? apiResult6k4;
  Completer<List<UsuariosRow>>? requestCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  Color? colorPicked;
  // State field(s) for cor widget.
  FocusNode? corFocusNode;
  TextEditingController? corTextController;
  String? Function(BuildContext, String?)? corTextControllerValidator;
  String? _corTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController5Validator;
  String? _textController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Trocar senha)] action in Button widget.
  ApiCallResponse? response;

  @override
  void initState(BuildContext context) {
    menubarModel = createModel(context, () => MenubarModel());
    appbarModel = createModel(context, () => AppbarModel());
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    corTextControllerValidator = _corTextControllerValidator;
    passwordVisibility1 = false;
    textController5Validator = _textController5Validator;
    passwordVisibility2 = false;
    textController6Validator = _textController6Validator;
  }

  @override
  void dispose() {
    menubarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    appbarModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    corFocusNode?.dispose();
    corTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();
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
