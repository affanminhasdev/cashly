import '/components_effects/dialog_infoposterga/dialog_infoposterga_widget.dart';
import '/components_effects/dialog_success/dialog_success_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'reativar_dialog_model.dart';
export 'reativar_dialog_model.dart';

/// criar uma caixa de diálogo que apresente 3 botões de opções.
///
/// o Componente deve ser responsivo e os botões não precisam ter ícones,
/// apenas texto. Se possível colocar a formatação hover onde ao passar o
/// cursor em cima do botão ele muda de cor. Usar tonalidades e variações em
/// roxo.
class ReativarDialogWidget extends StatefulWidget {
  const ReativarDialogWidget({
    super.key,
    required this.onselectvaluereativar,
    required this.onselectedvalue3,
  });

  final Future Function(int valuereativar)? onselectvaluereativar;
  final Future Function(int value3)? onselectedvalue3;

  @override
  State<ReativarDialogWidget> createState() => _ReativarDialogWidgetState();
}

class _ReativarDialogWidgetState extends State<ReativarDialogWidget> {
  late ReativarDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReativarDialogModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x1A000000),
            offset: Offset(
              0.0,
              0.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Wrap(
          spacing: 0.0,
          runSpacing: 0.0,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            if (responsiveVisibility(
              context: context,
              tablet: false,
            ))
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Essa é a sua chance de Desbloquear agora seu celular, escolha uma das opções.',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Ubuntu',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: DialogInfopostergaWidget(
                                    mensagem:
                                        'Seu celular será desbloqueado por um período de 15 minutos. Após esse período, ele será bloqueado novamente. A nova liberação só será feita mediante o pagamento da parcela pendente.  Para evitar transtornos, regularize sua situação o quanto antes. ',
                                  ),
                                ),
                              );
                            },
                          );

                          await widget.onselectvaluereativar?.call(
                            1,
                          );
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: DialogSuccessWidget(
                                    mensagem:
                                        'Comando de desbloqueio enviado com sucesso. Aguardar novo link pix para pagar em até 15 Min.',
                                  ),
                                ),
                              );
                            },
                          );

                          Navigator.pop(context);
                        },
                        text: 'Desbloquear p/ 15 Min - SEM CUSTO',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: DialogInfopostergaWidget(
                                  mensagem:
                                      'Seu celular será desbloqueado por um período de 4 horas. Após esse período, ele será bloqueado novamente. A nova liberação só será feita mediante o pagamento da parcela pendente.  Para evitar transtornos, regularize sua situação o quanto antes. ',
                                ),
                              ),
                            );
                          },
                        );

                        await widget.onselectvaluereativar?.call(
                          2,
                        );
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: DialogSuccessWidget(
                                  mensagem:
                                      'Comando de desbloqueio enviado com sucesso. Aguardar novo link pix para pagar em até 4 horas.',
                                ),
                              ),
                            );
                          },
                        );

                        Navigator.pop(context);
                      },
                      text: 'Desbloquear p/ 4 Horas - Tarifa de R\$ 3,00',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF333333),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Ubuntu',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: DialogInfopostergaWidget(
                                    mensagem:
                                        'Seu celular será desbloqueado por um período de 12 Horas. Após esse período, ele será bloqueado novamente. A nova liberação só será feita mediante o pagamento da parcela pendente.  Para evitar transtornos, regularize sua situação o quanto antes. ',
                                  ),
                                ),
                              );
                            },
                          );

                          await widget.onselectvaluereativar?.call(
                            3,
                          );
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: DialogSuccessWidget(
                                    mensagem:
                                        'Comando de desbloqueio enviado com sucesso. Aguardar novo link pix para pagar em até 12 Horas.',
                                  ),
                                ),
                              );
                            },
                          );

                          Navigator.pop(context);
                        },
                        text: 'Desbloquear p/ 12 Horas - Tarifa de R\$ 6,00',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF540B0E),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: DialogInfopostergaWidget(
                                    mensagem:
                                        'Seu celular será desbloqueado por um período de 24 Horas. Após esse período, ele será bloqueado novamente. A nova liberação só será feita mediante o pagamento da parcela pendente.  Para evitar transtornos, regularize sua situação o quanto antes. ',
                                  ),
                                ),
                              );
                            },
                          );

                          await widget.onselectvaluereativar?.call(
                            4,
                          );
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: DialogSuccessWidget(
                                    mensagem:
                                        'Comando de desbloqueio enviado com sucesso. Aguardar novo link pix para pagar em até 24 Horas.',
                                  ),
                                ),
                              );
                            },
                          );

                          Navigator.pop(context);
                        },
                        text: 'Desbloquear p/ 24 Horas - Tarifa de R\$ 9,00',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF0A9396),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)).around(SizedBox(height: 5.0)),
              ),
          ],
        ),
      ),
    );
  }
}
