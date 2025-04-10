import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'approve_button_model.dart';
export 'approve_button_model.dart';

class ApproveButtonWidget extends StatefulWidget {
  const ApproveButtonWidget({
    super.key,
    required this.planoId,
  });

  final int? planoId;

  @override
  State<ApproveButtonWidget> createState() => _ApproveButtonWidgetState();
}

class _ApproveButtonWidgetState extends State<ApproveButtonWidget> {
  late ApproveButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApproveButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlanoRow>>(
      future: PlanoTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id_pedido',
          widget.planoId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<PlanoRow> containerPlanoRowList = snapshot.data!;

        final containerPlanoRow = containerPlanoRowList.isNotEmpty
            ? containerPlanoRowList.first
            : null;

        return Container(
          decoration: BoxDecoration(),
          child: FFButtonWidget(
            onPressed: containerPlanoRow!.aprovarPix!
                ? null
                : () async {
                    await PlanoTable().update(
                      data: {
                        'aprovar_pix': true,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id_pedido',
                        widget.planoId,
                      ),
                    );
                    await PixTable().update(
                      data: {
                        'status': 'Processamento',
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'plano_id',
                        widget.planoId,
                      ),
                    );
                  },
            text: containerPlanoRow.aprovarPix == true
                ? 'Pix enviado'
                : 'Aprovar',
            options: FFButtonOptions(
              width: 100.0,
              height: 30.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).alternate,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Ubuntu',
                    color: containerPlanoRow.aprovarPix!
                        ? FlutterFlowTheme.of(context).success
                        : FlutterFlowTheme.of(context).primary,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryText,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
              disabledColor: FlutterFlowTheme.of(context).alternate,
            ),
          ),
        );
      },
    );
  }
}
