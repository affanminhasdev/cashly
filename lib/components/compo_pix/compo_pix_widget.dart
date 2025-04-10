import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'compo_pix_model.dart';
export 'compo_pix_model.dart';

class CompoPixWidget extends StatefulWidget {
  const CompoPixWidget({
    super.key,
    this.aprovar,
    required this.callback,
  });

  final List<PixRow>? aprovar;
  final Future Function()? callback;

  @override
  State<CompoPixWidget> createState() => _CompoPixWidgetState();
}

class _CompoPixWidgetState extends State<CompoPixWidget> {
  late CompoPixModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompoPixModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.savedChavePix = 'queryLead.chave_pix';
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final aprovar = widget.aprovar?.toList() ?? [];

          return FlutterFlowDataTable<PixRow>(
            controller: _model.dataPixController,
            data: aprovar,
            columnsBuilder: (onSortChanged) => [
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Nome',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'CPF',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Chave Pix',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Data Criação Pix',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Valor Pix',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Aprovar',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Link Pagamento',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
            dataRowBuilder:
                (aprovarItem, aprovarIndex, selected, onSelectChanged) =>
                    DataRow(
              color: WidgetStateProperty.all(
                aprovarIndex % 2 == 0
                    ? FlutterFlowTheme.of(context).alternate
                    : FlutterFlowTheme.of(context).primaryBackground,
              ),
              cells: [
                Text(
                  valueOrDefault<String>(
                    aprovarItem.nome,
                    'Rodrigo',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    aprovarItem.cpf,
                    'cpf',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    aprovarItem.chavePix,
                    'chave pix',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      "d/M/y HH:mm",
                      functions.addMoreHours(aprovarItem.createdAt!, 3),
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'Not Set',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    formatNumber(
                      aprovarItem.valor,
                      formatType: FormatType.custom,
                      currency: 'R\$ ',
                      format: '#,##0.00',
                      locale: 'pt',
                    ),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    children: [
                      FFButtonWidget(
                        onPressed: (aprovarItem.status != 'Aprovar')
                            ? null
                            : () async {
                                await PlanoTable().update(
                                  data: {
                                    'aprovar_pix': true,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id_pedido',
                                    aprovarItem.planoId,
                                  ),
                                );
                                await PixTable().update(
                                  data: {
                                    'status': 'Processamento',
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'plano_id',
                                    aprovarItem.planoId,
                                  ),
                                );
                                await widget.callback?.call();
                              },
                        text: valueOrDefault<String>(
                          aprovarItem.status,
                          'Aprovar',
                        ),
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 30.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Ubuntu',
                                    color: aprovarItem.status == 'Pago'
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
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 30.0,
                          fillColor: FlutterFlowTheme.of(context).error,
                          icon: Icon(
                            Icons.delete_forever,
                            color: FlutterFlowTheme.of(context).info,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            await PixTable().delete(
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                aprovarItem.id,
                              ),
                            );

                            safeSetState(() {});
                            unawaited(
                              () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Registro deletado com sucesso',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).success,
                                  ),
                                );
                              }(),
                            );
                            await widget.callback?.call();
                            await PlanoTable().update(
                              data: {
                                'aprovar_emprestimo': 1,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id_pedido',
                                aprovarItem.planoId,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: aprovarItem.pagamentoLinkUrl != null &&
                      aprovarItem.pagamentoLinkUrl != '',
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await launchURL(valueOrDefault<String>(
                            aprovarItem.pagamentoLinkUrl,
                            '\"\"',
                          ));
                        },
                        text: '',
                        icon: FaIcon(
                          FontAwesomeIcons.solidFilePdf,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Ubuntu',
                                color: FlutterFlowTheme.of(context).tertiary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ].map((c) => DataCell(c)).toList(),
            ),
            paginated: false,
            selectable: false,
            height: MediaQuery.sizeOf(context).height * 0.8,
            headingRowHeight: 50.0,
            dataRowHeight: 45.0,
            columnSpacing: 10.0,
            headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(0.0),
            addHorizontalDivider: true,
            addTopAndBottomDivider: false,
            hideDefaultHorizontalDivider: true,
            horizontalDividerColor:
                FlutterFlowTheme.of(context).secondaryBackground,
            horizontalDividerThickness: 1.0,
            addVerticalDivider: true,
            verticalDividerColor:
                FlutterFlowTheme.of(context).secondaryBackground,
            verticalDividerThickness: 1.0,
          );
        },
      ),
    );
  }
}
