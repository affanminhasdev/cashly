import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pix_component_model.dart';
export 'pix_component_model.dart';

class PixComponentWidget extends StatefulWidget {
  const PixComponentWidget({
    super.key,
    this.aprovar,
    required this.callback,
  });

  final List<PixRow>? aprovar;
  final Future Function()? callback;

  @override
  State<PixComponentWidget> createState() => _PixComponentWidgetState();
}

class _PixComponentWidgetState extends State<PixComponentWidget> {
  late PixComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PixComponentModel());

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
      height: MediaQuery.sizeOf(context).height * 1.0,
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
                    'Data Pix',
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
                    'Status',
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
                FutureBuilder<List<LeadRow>>(
                  future: LeadTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      aprovarItem.leadId,
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
                    List<LeadRow> textLeadRowList = snapshot.data!;

                    final textLeadRow = textLeadRowList.isNotEmpty
                        ? textLeadRowList.first
                        : null;

                    return Text(
                      valueOrDefault<String>(
                        textLeadRow?.nome,
                        'None',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Ubuntu',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    );
                  },
                ),
                Text(
                  valueOrDefault<String>(
                    formatNumber(
                      aprovarItem.valor,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                      currency: 'R\$ ',
                    ),
                    '0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                FutureBuilder<List<LeadRow>>(
                  future: LeadTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      aprovarItem.leadId,
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
                    List<LeadRow> textLeadRowList = snapshot.data!;

                    final textLeadRow = textLeadRowList.isNotEmpty
                        ? textLeadRowList.first
                        : null;

                    return Text(
                      valueOrDefault<String>(
                        textLeadRow?.chavePix,
                        'None',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Ubuntu',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    );
                  },
                ),
                Text(
                  valueOrDefault<String>(
                    dateTimeFormat(
                      "d/M/y HH:mm",
                      aprovarItem.createdAt,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    'Not Set',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    aprovarItem.status,
                    'Aguardando Aprovação',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await launchURL(aprovarItem.pagamentoLinkUrl!);
                  },
                  text: '',
                  icon: FaIcon(
                    FontAwesomeIcons.filePdf,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 44.0,
                    height: 30.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Ubuntu',
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].map((c) => DataCell(c)).toList(),
            ),
            paginated: false,
            selectable: false,
            height: 100.0,
            headingRowHeight: 40.0,
            dataRowHeight: 30.0,
            columnSpacing: 20.0,
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
