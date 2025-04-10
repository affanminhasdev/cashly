import '/backend/supabase/supabase.dart';
import '/components/change_payment_status/change_payment_status_widget.dart';
import '/components/comentario/comentario_widget.dart';
import '/components/create_payment_line/create_payment_line_widget.dart';
import '/components/input_date_payments/input_date_payments_widget.dart';
import '/components_effects/dialog_confirm/dialog_confirm_widget.dart';
import '/components_effects/dialog_failed/dialog_failed_widget.dart';
import '/components_effects/shimmer_search/shimmer_search_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'data_table_body_model.dart';
export 'data_table_body_model.dart';

class DataTableBodyWidget extends StatefulWidget {
  const DataTableBodyWidget({
    super.key,
    required this.idPlano,
    this.leadId,
    required this.refreshCallback,
  });

  final int? idPlano;
  final int? leadId;
  final Future Function()? refreshCallback;

  @override
  State<DataTableBodyWidget> createState() => _DataTableBodyWidgetState();
}

class _DataTableBodyWidgetState extends State<DataTableBodyWidget> {
  late DataTableBodyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataTableBodyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.subscribe(
        'pagamento',
        () async {
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
      _model.isLoading = false;
      safeSetState(() {});

      _model.updatePage(() {});
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
    context.watch<FFAppState>();

    return Visibility(
      visible: !_model.isLoading,
      child: FutureBuilder<List<PagamentoRow>>(
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
          List<PagamentoRow> pagamentoDataPagamentoRowList = snapshot.data!;

          return Container(
            height: functions
                .containerPaymentSize(pagamentoDataPagamentoRowList.length),
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Builder(
                      builder: (context) {
                        final parcelas = pagamentoDataPagamentoRowList.toList();

                        return FlutterFlowDataTable<PagamentoRow>(
                          controller: _model.paginatedDataTableController,
                          data: parcelas,
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
                              fixedWidth: 60.0,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
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
                              fixedWidth:
                                  MediaQuery.sizeOf(context).width * 0.08,
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
                              fixedWidth: 100.0,
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
                              fixedWidth: 120.0,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'Comentário',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              fixedWidth: 250.0,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Data Pagamento',
                                    textAlign: TextAlign.center,
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
                              fixedWidth: 120.0,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Pix',
                                    textAlign: TextAlign.center,
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
                              fixedWidth: 120.0,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'Deletar',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              fixedWidth: 65.0,
                            ),
                          ],
                          dataRowBuilder: (parcelasItem, parcelasIndex,
                                  selected, onSelectChanged) =>
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
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    MaterialTapTargetSize
                                                        .padded,
                                                shape: CircleBorder(),
                                              ),
                                              unselectedWidgetColor:
                                                  Color(0xFF686A76),
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValueMap1[
                                                      parcelasItem] ??=
                                                  parcelasItem.postergado,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                        .checkboxValueMap1[
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
                                      10.0, 0.0, 0.0, 0.0),
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
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child:
                                                    ChangePaymentStatusWidget(
                                                  line: parcelasItem,
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        safeSetState(() =>
                                            _model.requestCompleter = null);
                                        await _model.waitForRequestCompleted();
                                      }
                                    },
                                    child: Container(
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
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          parcelasItem.status!,
                                          textAlign: TextAlign.center,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                            if (FFAppState().Usuario.role ==
                                                2) {
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
                                                      child:
                                                          InputDatePaymentsWidget(
                                                        id: parcelasItem.id,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              safeSetState(() => _model
                                                  .requestCompleter = null);
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                              ComentarioWidget(
                                key: Key(
                                    'Keyi0w_${parcelasIndex}_of_${parcelas.length}'),
                                parameter1: parcelasItem.comentario,
                                id: parcelasItem.id,
                              ),
                              Visibility(
                                visible: parcelasItem.status == 'Pago',
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "dd/MM/yyyy H:mm",
                                      parcelasItem.dataPagamento,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    'Sem Data',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Opacity(
                                    opacity: 0.8,
                                    child: Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValueMap2[
                                                parcelasItem] ??=
                                            parcelasItem.gerarPixAvulso!,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxValueMap2[
                                                  parcelasItem] = newValue!);
                                          if (newValue!) {
                                            await PagamentoTable().update(
                                              data: {
                                                'gerar_pix_avulso': true,
                                              },
                                              matchingRows: (rows) =>
                                                  rows.eqOrNull(
                                                'id',
                                                parcelasItem.id,
                                              ),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  '✔️ Pix avulso criado . Estamos enviando para o WhatsApp do cliente. Chegará em breve (até 3 minutos).',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            );
                                          } else {
                                            await PagamentoTable().update(
                                              data: {
                                                'gerar_pix_avulso': false,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ),
                                  if (parcelasItem.linkPagamento != null &&
                                      parcelasItem.linkPagamento != '')
                                    Container(
                                      width: 93.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: valueOrDefault<
                                                          String>(
                                                parcelasItem.linkPagamento,
                                                'Sem link',
                                              )));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Copiado com sucesso!!',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                ),
                                              );
                                            },
                                            text: '',
                                            icon: FaIcon(
                                              FontAwesomeIcons.copy,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 40.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  parcelasItem.linkPagamento!);
                                            },
                                            text: '',
                                            icon: FaIcon(
                                              FontAwesomeIcons.externalLinkAlt,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 40.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 35.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: double.infinity,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          icon: Icon(
                                            Icons.delete_forever_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 16.0,
                                          ),
                                          onPressed: () async {
                                            if (parcelasItem.status == 'Pago') {
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
                                                      child: DialogFailedWidget(
                                                        mensagem:
                                                            'Proibido deletar plano',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
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
                                                      child:
                                                          DialogConfirmWidget(
                                                        mensagem:
                                                            'Tem certeza que você deseja excluir essa parcela?',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () =>
                                                      _model.response = value));

                                              if (_model.response!) {
                                                await PagamentoTable().delete(
                                                  matchingRows: (rows) => rows
                                                      .eqOrNull(
                                                        'id',
                                                        parcelasItem.id,
                                                      )
                                                      .neqOrNull(
                                                        'status',
                                                        'Pago',
                                                      ),
                                                );
                                                safeSetState(() => _model
                                                    .requestCompleter = null);
                                                await _model
                                                    .waitForRequestCompleted();

                                                _model.updatePage(() {});
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].map((c) => DataCell(c)).toList(),
                          ),
                          paginated: false,
                          selectable: false,
                          headingRowHeight: 38.0,
                          dataRowHeight: 34.0,
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
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 10.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 32.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.isLoading = true;
                          safeSetState(() {});
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
                                  child: Container(
                                    width: 900.0,
                                    child: CreatePaymentLineWidget(
                                      parcela:
                                          pagamentoDataPagamentoRowList.length,
                                      plano: widget.idPlano!,
                                      leadId: widget.leadId,
                                      callback: () async {
                                        safeSetState(() =>
                                            _model.requestCompleter = null);
                                        await _model.waitForRequestCompleted();
                                        _model.isLoading = false;
                                        safeSetState(() {});

                                        _model.updatePage(() {});
                                      },
                                      onClose: () async {
                                        _model.isLoading = false;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
