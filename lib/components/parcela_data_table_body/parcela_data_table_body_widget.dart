import '/backend/supabase/supabase.dart';
import '/components/change_payment_status/change_payment_status_widget.dart';
import '/components/input_date_payments/input_date_payments_widget.dart';
import '/components_effects/dialog_info/dialog_info_widget.dart';
import '/components_effects/postergar_dropdown/postergar_dropdown_widget.dart';
import '/components_effects/shimmer_search/shimmer_search_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'parcela_data_table_body_model.dart';
export 'parcela_data_table_body_model.dart';

class ParcelaDataTableBodyWidget extends StatefulWidget {
  const ParcelaDataTableBodyWidget({
    super.key,
    required this.idPlano,
    this.leadId,
  });

  final int? idPlano;
  final int? leadId;

  @override
  State<ParcelaDataTableBodyWidget> createState() =>
      _ParcelaDataTableBodyWidgetState();
}

class _ParcelaDataTableBodyWidgetState
    extends State<ParcelaDataTableBodyWidget> {
  late ParcelaDataTableBodyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParcelaDataTableBodyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<PagamentoRow>>(
      future: (_model.requestCompleter ??= Completer<List<PagamentoRow>>()
            ..complete(PagamentoTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'id_plano',
                    widget.idPlano,
                  )
                  .order('parcela', ascending: true),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return ShimmerSearchWidget();
        }
        List<PagamentoRow> containerPagamentoRowList = snapshot.data!;

        return Container(
          height:
              functions.containerPaymentSize(containerPagamentoRowList.length),
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Builder(
                    builder: (context) {
                      final parcelas = containerPagamentoRowList.toList();

                      return FlutterFlowDataTable<PagamentoRow>(
                        controller: _model.paginatedDataTableController,
                        data: parcelas,
                        numRows: containerPagamentoRowList.length,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Parcela',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Status',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Valor',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Data Vencimento',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Acoes',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        dataRowBuilder: (parcelasItem, parcelasIndex, selected,
                                onSelectChanged) =>
                            DataRow(
                          color: WidgetStateProperty.all(
                            parcelasIndex % 2 == 0
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                          cells: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 53.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            parcelasItem.parcela!.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.standard,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize.padded,
                                              shape: CircleBorder(),
                                            ),
                                            unselectedWidgetColor:
                                                Color(0xFF686A76),
                                          ),
                                          child: Checkbox(
                                            value: _model.checkboxValueMap[
                                                    parcelasItem] ??=
                                                parcelasItem.postergado,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                      .checkboxValueMap[
                                                  parcelasItem] = newValue!);
                                              if (newValue!) {
                                                await PagamentoTable().update(
                                                  data: {
                                                    'postergado': true,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    parcelasItem.id,
                                                  ),
                                                );
                                              } else {
                                                await PagamentoTable().update(
                                                  data: {
                                                    'postergado': false,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    parcelasItem.id,
                                                  ),
                                                );
                                              }
                                            },
                                            side: BorderSide(
                                              width: 2,
                                              color: Color(0xFF686A76),
                                            ),
                                            activeColor: Color(0xFF963CD5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().Usuario.role == 2) {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: ChangePaymentStatusWidget(
                                                line: parcelasItem,
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      safeSetState(
                                          () => _model.requestCompleter = null);
                                      await _model.waitForRequestCompleted();
                                    }
                                  },
                                  child: Container(
                                    width: 150.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (parcelasItem.status ==
                                            'Em Aberto') {
                                          return FlutterFlowTheme.of(context)
                                              .warning;
                                        } else if (parcelasItem.status ==
                                            'Pago') {
                                          return FlutterFlowTheme.of(context)
                                              .success;
                                        } else if (parcelasItem.status ==
                                            'Prorrogado') {
                                          return FlutterFlowTheme.of(context)
                                              .accent1;
                                        } else if (parcelasItem.status ==
                                            'Vencido') {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryText;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        parcelasItem.status!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Ubuntu',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                formatNumber(
                                  parcelasItem.valor!,
                                  formatType: FormatType.custom,
                                  currency: 'R\$ ',
                                  format: '##,##0.00',
                                  locale: 'pt',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Container(
                              width: 411.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (FFAppState().Usuario.role == 2) {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child:
                                                        InputDatePaymentsWidget(
                                                      id: parcelasItem.id,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                            await _model
                                                .waitForRequestCompleted();
                                          }
                                        },
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              "dd/MM/yyyy H:mm",
                                              parcelasItem.dataDeVencimento,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            ' Sem Data',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Ubuntu',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PostergarDropdownWidget(
                                    key: Key(
                                        'Key808_${parcelasIndex}_of_${parcelas.length}'),
                                    pagamentoId: parcelasItem.id,
                                    selectedPostergar:
                                        parcelasItem.postergaPlano,
                                    onSelectedValue: (value) async {
                                      _model.selectedParcela = value;
                                      safeSetState(() {});
                                    },
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: ((_model.selectedParcela ==
                                                        null ||
                                                    _model.selectedParcela ==
                                                        '') &&
                                                (parcelasItem.postergaPlano ==
                                                    null))
                                            ? null
                                            : () async {
                                                // onDropdownSelected
                                                await PagamentoTable().update(
                                                  data: {
                                                    'postergado': true,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    parcelasItem.id,
                                                  ),
                                                );
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: DialogInfoWidget(
                                                          mensagem:
                                                              'Instalment postponded successfully',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                        text: 'Postergar',
                                        options: FFButtonOptions(
                                          height: 29.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Ubuntu',
                                                    color: Colors.white,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        paginated: false,
                        selectable: false,
                        headingRowHeight: 38.0,
                        dataRowHeight: 40.0,
                        columnSpacing: 20.0,
                        headingRowColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        addHorizontalDivider: true,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: true,
                        horizontalDividerColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        horizontalDividerThickness: 1.0,
                        addVerticalDivider: false,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
