import '/backend/supabase/supabase.dart';
import '/components/approve_loan_icon_widget.dart';
import '/components/input_date_pix/input_date_pix_widget.dart';
import '/components_effects/device_dropdown/device_dropdown_widget.dart';
import '/components_effects/dialog_confirm/dialog_confirm_widget.dart';
import '/components_effects/dialog_failed/dialog_failed_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'data_table_header_model.dart';
export 'data_table_header_model.dart';

class DataTableHeaderWidget extends StatefulWidget {
  const DataTableHeaderWidget({
    super.key,
    this.parameter1,
    required this.callback,
    required this.leadId,
  });

  final List<PlanoRow>? parameter1;
  final Future Function()? callback;
  final int? leadId;

  @override
  State<DataTableHeaderWidget> createState() => _DataTableHeaderWidgetState();
}

class _DataTableHeaderWidgetState extends State<DataTableHeaderWidget> {
  late DataTableHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataTableHeaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allDevices = await actions.fetchDevices();
      _model.isLoading = false;
      safeSetState(() {});
      await actions.subscribe(
        'ccb',
        () async {
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
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

    return Stack(
      children: [
        if (!_model.isLoading)
          Container(
            height: 93.0,
            child: Builder(
              builder: (context) {
                final tabela = widget.parameter1?.toList() ?? [];

                return FlutterFlowDataTable<PlanoRow>(
                  controller: _model.paginatedDataTableController,
                  data: tabela,
                  numRows: widget.parameter1?.length,
                  columnsBuilder: (onSortChanged) => [
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Tipo',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
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
                        child: Container(),
                      ),
                      fixedWidth: 0.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          '',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      fixedWidth: 0.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Container(),
                      ),
                      fixedWidth: 0.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Data Pix',
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
                      fixedWidth: 100.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Device',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            if (tabela.firstOrNull?.tipoDevice == 'TV')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.tv,
                                  color: Color(0xFF7E7E7E),
                                  size: 14.0,
                                ),
                              ),
                            if (tabela.firstOrNull?.tipoDevice == 'Celular')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.mobileAlt,
                                  color: Color(0xFF7E7E7E),
                                  size: 14.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                      fixedWidth: 110.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Pix',
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
                      fixedWidth: 110.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Total',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Ubuntu',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      fixedWidth: 110.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Juros',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Ubuntu',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      fixedWidth: 70.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Prazo',
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
                      fixedWidth: 80.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Parcela',
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
                      fixedWidth: 100.0,
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  ' Device',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  dataRowBuilder:
                      (tabelaItem, tabelaIndex, selected, onSelectChanged) =>
                          DataRow(
                    color: WidgetStateProperty.all(
                      tabelaIndex % 2 == 0
                          ? FlutterFlowTheme.of(context).alternate
                          : FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    cells: [
                      Text(
                        tabelaItem.tipo!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Ubuntu',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(),
                      Text(
                        '',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Ubuntu',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) => FutureBuilder<List<PixRow>>(
                            future: PixTable().querySingleRow(
                              queryFn: (q) => q.eqOrNull(
                                'plano_id',
                                tabelaItem.idPedido,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<PixRow> textPixRowList = snapshot.data!;

                              final textPixRow = textPixRowList.isNotEmpty
                                  ? textPixRowList.first
                                  : null;

                              return InkWell(
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
                                            child: InputDatePixWidget(
                                              id: tabelaItem.idPedido,
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    await widget.callback?.call();
                                  }
                                },
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "dd/MM/yy",
                                      tabelaItem.dataPix,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    'sem data',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            formatNumber(
                              tabelaItem.valorCelular,
                              formatType: FormatType.custom,
                              currency: 'R\$ ',
                              format: '##,#00.00',
                              locale: 'pt',
                            ),
                            ' 0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            formatNumber(
                              tabelaItem.valorPix,
                              formatType: FormatType.custom,
                              currency: 'R\$ ',
                              format: '##,#00.00',
                              locale: 'pt',
                            ),
                            ' 0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            formatNumber(
                              tabelaItem.valor,
                              formatType: FormatType.custom,
                              currency: 'R\$ ',
                              format: '##,#00.00',
                              locale: 'pt',
                            ),
                            ' 0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          '${valueOrDefault<String>(
                            formatNumber(
                              tabelaItem.juros,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.commaDecimal,
                            ),
                            ' 0',
                          )}%',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            tabelaItem.numeroParcelas,
                            ' 0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            formatNumber(
                              tabelaItem.parcela,
                              formatType: FormatType.custom,
                              currency: 'R\$ ',
                              format: '##,#00.00',
                              locale: 'pt',
                            ),
                            ' 0',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 240.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.deviceDropdownModels.getModel(
                                      widget.parameter1!.firstOrNull!.idPedido
                                          .toString(),
                                      tabelaIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: DeviceDropdownWidget(
                                      key: Key(
                                        'Keyzxw_${widget.parameter1!.firstOrNull!.idPedido.toString()}',
                                      ),
                                      planId: widget
                                          .parameter1!.firstOrNull!.idPedido,
                                      deviceId: widget
                                          .parameter1?.firstOrNull?.deviceId,
                                      deviceList: tabelaItem.deviceList,
                                      allDevices: _model.allDevices!,
                                    ),
                                  ),
                                ),
                                ApproveLoanIconWidget(
                                  key: Key(
                                      'Keyzvn_${tabelaIndex}_of_${tabela.length}'),
                                  plano: tabelaItem,
                                  onTap: () async {
                                    await PlanoTable().update(
                                      data: {
                                        'aprovar_emprestimo': 2,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id_pedido',
                                        tabelaItem.idPedido,
                                      ),
                                    );
                                    await widget.callback?.call();
                                    _model.leadData =
                                        await LeadTable().queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        tabelaItem.leadId,
                                      ),
                                    );
                                    await PixTable().insert({
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'valor': tabelaItem.valor,
                                      'chave_pix': _model
                                          .leadData?.firstOrNull?.chavePix,
                                      'status': 'Aprovar',
                                      'pagamento_link_url':
                                          tabelaItem.pagamentoLinkUrl,
                                      'lead_id': tabelaItem.leadId,
                                      'plano_id': tabelaItem.idPedido,
                                      'document_number':
                                          tabelaItem.documentNumber,
                                      'nome':
                                          _model.leadData?.firstOrNull?.nome,
                                      'cpf': _model.leadData?.firstOrNull?.cpf,
                                      'data_de_pagamento':
                                          supaSerialize<DateTime>(
                                              tabelaItem.primeiroPagamento),
                                    });

                                    safeSetState(() {});
                                  },
                                ),
                                FutureBuilder<List<CcbRow>>(
                                  future: (_model.requestCompleter ??=
                                          Completer<List<CcbRow>>()
                                            ..complete(
                                                CcbTable().querySingleRow(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'id_plano_ccb',
                                                    tabelaItem.idPedido,
                                                  )
                                                  .eqOrNull(
                                                    'id_lead_ccb',
                                                    widget.leadId,
                                                  ),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CcbRow> cCBDataCcbRowList =
                                        snapshot.data!;

                                    final cCBDataCcbRow =
                                        cCBDataCcbRowList.isNotEmpty
                                            ? cCBDataCcbRowList.first
                                            : null;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          if (tabelaItem.emitirCcb! &&
                                              (cCBDataCcbRow?.statusCcb ==
                                                      null ||
                                                  cCBDataCcbRow?.statusCcb ==
                                                      '')) {
                                            return AlignedTooltip(
                                              content: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Aguardando Emissão',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              offset: 4.0,
                                              preferredDirection:
                                                  AxisDirection.down,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 4.0,
                                              tailBaseWidth: 24.0,
                                              tailLength: 12.0,
                                              waitDuration:
                                                  Duration(milliseconds: 100),
                                              showDuration:
                                                  Duration(milliseconds: 1500),
                                              triggerMode:
                                                  TooltipTriggerMode.tap,
                                              child: Container(
                                                height: 26.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      'Emitir CCB',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Ubuntu',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await PlanoTable().update(
                                                  data: {
                                                    'emitir_ccb': true,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id_pedido',
                                                    tabelaItem.idPedido,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 26.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    cCBDataCcbRow?.statusCcb !=
                                                                null &&
                                                            cCBDataCcbRow
                                                                    ?.statusCcb !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .success
                                                        : Color(0x71B7B7B7),
                                                    Color(0x71B7B7B7),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        cCBDataCcbRow?.statusCcb !=
                                                                    null &&
                                                                cCBDataCcbRow
                                                                        ?.statusCcb !=
                                                                    ''
                                                            ? cCBDataCcbRow
                                                                ?.statusCcb
                                                            : 'Emitir CCB',
                                                        'Emitir CCB',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Ubuntu',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (tabelaItem.enviarContrato! &&
                                    (tabelaItem.statusContrato == null ||
                                        tabelaItem.statusContrato == '')) {
                                  return AlignedTooltip(
                                    content: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text(
                                        'Aguardando Assinatura',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Ubuntu',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    offset: 4.0,
                                    preferredDirection: AxisDirection.down,
                                    borderRadius: BorderRadius.circular(8.0),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    elevation: 4.0,
                                    tailBaseWidth: 24.0,
                                    tailLength: 12.0,
                                    waitDuration: Duration(milliseconds: 100),
                                    showDuration: Duration(milliseconds: 1500),
                                    triggerMode: TooltipTriggerMode.tap,
                                    child: Container(
                                      height: 26.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            'Enviar contrato',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await PlanoTable().update(
                                        data: {
                                          'enviar_contrato': true,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id_pedido',
                                          tabelaItem.idPedido,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 26.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          tabelaItem.statusContrato != null &&
                                                  tabelaItem.statusContrato !=
                                                      ''
                                              ? FlutterFlowTheme.of(context)
                                                  .success
                                              : Color(0x71B7B7B7),
                                          Color(0x71B7B7B7),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              tabelaItem.statusContrato !=
                                                          null &&
                                                      tabelaItem
                                                              .statusContrato !=
                                                          ''
                                                  ? tabelaItem.statusContrato
                                                  : 'Enviar contrato',
                                              'Enviar contrato',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Ubuntu',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 65.58,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AlignedTooltip(
                                  content: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      'Deletar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Ubuntu',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                  offset: 4.0,
                                  preferredDirection: AxisDirection.up,
                                  borderRadius: BorderRadius.circular(8.0),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 4.0,
                                  tailBaseWidth: 24.0,
                                  tailLength: 12.0,
                                  waitDuration: Duration(milliseconds: 20),
                                  showDuration: Duration(milliseconds: 1000),
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          icon: Icon(
                                            Icons.delete_forever,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 15.0,
                                          ),
                                          onPressed: () async {
                                            _model.instalments =
                                                await PagamentoTable()
                                                    .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'id_plano',
                                                    tabelaItem.idPedido,
                                                  )
                                                  .eqOrNull(
                                                    'status',
                                                    'Pago',
                                                  ),
                                            );
                                            if (_model.instalments != null &&
                                                (_model.instalments)!
                                                    .isNotEmpty) {
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
                                                            'Tem certeza que deseja excluir esse plano?',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () =>
                                                      _model.response = value));

                                              if (_model.response!) {
                                                await PlanoTable().delete(
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id_pedido',
                                                    widget.parameter1
                                                        ?.firstOrNull?.idPedido,
                                                  ),
                                                );
                                                await widget.callback?.call();
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ].map((c) => DataCell(c)).toList(),
                  ),
                  paginated: false,
                  selectable: false,
                  height: 100.0,
                  headingRowHeight: 40.0,
                  dataRowHeight: 52.0,
                  columnSpacing: 15.0,
                  headingRowColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                  addHorizontalDivider: true,
                  addTopAndBottomDivider: false,
                  hideDefaultHorizontalDivider: true,
                  horizontalDividerThickness: 1.0,
                  addVerticalDivider: true,
                  verticalDividerColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  verticalDividerThickness: 1.0,
                );
              },
            ),
          ),
        if (_model.isLoading)
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 45.0,
              height: 45.0,
              child: custom_widgets.CustomLoader(
                width: 45.0,
                height: 45.0,
                size: 45.0,
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
      ],
    );
  }
}
