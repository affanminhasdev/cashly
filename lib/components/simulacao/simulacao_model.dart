import '/components/simulacao/simulacao_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'simulacao_widget.dart' show SimulacaoWidget;
import 'package:flutter/material.dart';

class SimulacaoModel extends FlutterFlowModel<SimulacaoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for simulacao component.
  SimulacaoModel? _simulacaoModel;
  SimulacaoModel get simulacaoModel => _simulacaoModel ??= SimulacaoModel();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    simulacaoModel.dispose();
  }
}
