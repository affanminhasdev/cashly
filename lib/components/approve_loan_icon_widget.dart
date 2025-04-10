import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'approve_loan_icon_model.dart';
export 'approve_loan_icon_model.dart';

class ApproveLoanIconWidget extends StatefulWidget {
  const ApproveLoanIconWidget({
    super.key,
    required this.onTap,
    required this.plano,
  });

  final Future Function()? onTap;
  final PlanoRow? plano;

  @override
  State<ApproveLoanIconWidget> createState() => _ApproveLoanIconWidgetState();
}

class _ApproveLoanIconWidgetState extends State<ApproveLoanIconWidget> {
  late ApproveLoanIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApproveLoanIconModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.aprovarEmprestimo = widget.plano!.aprovarEmprestimo!;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: AlignedTooltip(
        content: Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            () {
              if (widget.plano?.aprovarEmprestimo == 1) {
                return 'Aprovação Pix';
              } else if ((_model.aprovarEmprestimo == 2) &&
                  (widget.plano?.aprovarPix == false)) {
                return 'Aguardando Aprovação';
              } else {
                return 'Pix Aprovado';
              }
            }(),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Ubuntu',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        offset: 4.0,
        preferredDirection: AxisDirection.up,
        borderRadius: BorderRadius.circular(8.0),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 4.0,
        tailBaseWidth: 24.0,
        tailLength: 12.0,
        waitDuration: Duration(milliseconds: 50),
        showDuration: Duration(milliseconds: 1000),
        triggerMode: TooltipTriggerMode.tap,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
          child: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 30.0,
            fillColor: () {
              if (_model.aprovarEmprestimo == 1) {
                return FlutterFlowTheme.of(context).secondaryText;
              } else if ((_model.aprovarEmprestimo == 2) &&
                  (widget.plano?.aprovarPix == false)) {
                return Color(0xFFEBDE10);
              } else {
                return FlutterFlowTheme.of(context).success;
              }
            }(),
            icon: FaIcon(
              FontAwesomeIcons.donate,
              color: FlutterFlowTheme.of(context).info,
              size: 15.0,
            ),
            showLoadingIndicator: true,
            onPressed: (_model.aprovarEmprestimo != 1)
                ? null
                : () async {
                    _model.aprovarEmprestimo = 2;
                    safeSetState(() {});
                    await widget.onTap?.call();
                  },
          ),
        ),
      ),
    );
  }
}
