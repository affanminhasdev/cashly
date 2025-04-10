import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/components/pix_tab_data/pix_tab_data_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crm_widget.dart' show CrmWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CrmModel extends FlutterFlowModel<CrmWidget> {
  ///  Local state fields for this page.

  bool isChecked = false;

  List<DeviceRow> devices = [];
  void addToDevices(DeviceRow item) => devices.add(item);
  void removeFromDevices(DeviceRow item) => devices.remove(item);
  void removeAtIndexFromDevices(int index) => devices.removeAt(index);
  void insertAtIndexInDevices(int index, DeviceRow item) =>
      devices.insert(index, item);
  void updateDevicesAtIndex(int index, Function(DeviceRow) updateFn) =>
      devices[index] = updateFn(devices[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  Completer<List<PlanoRow>>? requestCompleter4;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Model for Menubar component.
  late MenubarModel menubarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (Busca Lead)] action in TextField widget.
  ApiCallResponse? busca;
  // Stores action output result for [Backend Call - API (Paginacao Leads)] action in ListViewPaginationCRMCards widget.
  ApiCallResponse? paginacao;
  // Stores action output result for [Backend Call - API (Paginacao Leads)] action in ListViewPaginationCRMCards widget.
  ApiCallResponse? paginacaoIni;
  Completer<List<AnexosLeadRow>>? requestCompleter1;
  Completer<List<LeadRow>>? requestCompleter2;
  Completer<List<UsuariosRow>>? requestCompleter3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for blacklist widget.
  bool? blacklistValue1;
  // State field(s) for blacklist widget.
  bool? blacklistValue2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? response;
  // State field(s) for endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoTextController;
  String? Function(BuildContext, String?)? enderecoTextControllerValidator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode1;
  TextEditingController? numeroTextController1;
  String? Function(BuildContext, String?)? numeroTextController1Validator;
  // State field(s) for bairro widget.
  FocusNode? bairroFocusNode;
  TextEditingController? bairroTextController;
  String? Function(BuildContext, String?)? bairroTextControllerValidator;
  // State field(s) for complemento widget.
  FocusNode? complementoFocusNode;
  TextEditingController? complementoTextController;
  String? Function(BuildContext, String?)? complementoTextControllerValidator;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // State field(s) for cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;
  // State field(s) for estado widget.
  FocusNode? estadoFocusNode1;
  TextEditingController? estadoTextController1;
  String? Function(BuildContext, String?)? estadoTextController1Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for cnh widget.
  FocusNode? cnhFocusNode;
  TextEditingController? cnhTextController;
  String? Function(BuildContext, String?)? cnhTextControllerValidator;
  // State field(s) for estado widget.
  FocusNode? estadoFocusNode2;
  TextEditingController? estadoTextController2;
  String? Function(BuildContext, String?)? estadoTextController2Validator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode2;
  TextEditingController? numeroTextController2;
  String? Function(BuildContext, String?)? numeroTextController2Validator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode3;
  TextEditingController? numeroTextController3;
  String? Function(BuildContext, String?)? numeroTextController3Validator;
  // State field(s) for data_emissao widget.
  FocusNode? dataEmissaoFocusNode;
  TextEditingController? dataEmissaoTextController;
  String? Function(BuildContext, String?)? dataEmissaoTextControllerValidator;
  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode1;
  TextEditingController? telefoneTextController1;
  String? Function(BuildContext, String?)? telefoneTextController1Validator;
  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode2;
  TextEditingController? telefoneTextController2;
  String? Function(BuildContext, String?)? telefoneTextController2Validator;
  // State field(s) for pix widget.
  FocusNode? pixFocusNode;
  TextEditingController? pixTextController;
  String? Function(BuildContext, String?)? pixTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Model for PixTabData component.
  late PixTabDataModel pixTabDataModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    menubarModel = createModel(context, () => MenubarModel());
    pixTabDataModel = createModel(context, () => PixTabDataModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    menubarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    tabBarController?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    enderecoFocusNode?.dispose();
    enderecoTextController?.dispose();

    numeroFocusNode1?.dispose();
    numeroTextController1?.dispose();

    bairroFocusNode?.dispose();
    bairroTextController?.dispose();

    complementoFocusNode?.dispose();
    complementoTextController?.dispose();

    cepFocusNode?.dispose();
    cepTextController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();

    estadoFocusNode1?.dispose();
    estadoTextController1?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    cnhFocusNode?.dispose();
    cnhTextController?.dispose();

    estadoFocusNode2?.dispose();
    estadoTextController2?.dispose();

    numeroFocusNode2?.dispose();
    numeroTextController2?.dispose();

    numeroFocusNode3?.dispose();
    numeroTextController3?.dispose();

    dataEmissaoFocusNode?.dispose();
    dataEmissaoTextController?.dispose();

    telefoneFocusNode1?.dispose();
    telefoneTextController1?.dispose();

    telefoneFocusNode2?.dispose();
    telefoneTextController2?.dispose();

    pixFocusNode?.dispose();
    pixTextController?.dispose();

    pixTabDataModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
