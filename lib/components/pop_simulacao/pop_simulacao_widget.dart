import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pop_simulacao_model.dart';
export 'pop_simulacao_model.dart';

class PopSimulacaoWidget extends StatefulWidget {
  const PopSimulacaoWidget({super.key});

  @override
  State<PopSimulacaoWidget> createState() => _PopSimulacaoWidgetState();
}

class _PopSimulacaoWidgetState extends State<PopSimulacaoWidget> {
  late PopSimulacaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopSimulacaoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302.8,
      height: 304.83,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
