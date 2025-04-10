import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'parcela_table_header_model.dart';
export 'parcela_table_header_model.dart';

/// This the header that comes on the parcelas screen and it shows the
/// necessary data.
class ParcelaTableHeaderWidget extends StatefulWidget {
  const ParcelaTableHeaderWidget({
    super.key,
    required this.plano,
  });

  final List<PlanoRow>? plano;

  @override
  State<ParcelaTableHeaderWidget> createState() =>
      _ParcelaTableHeaderWidgetState();
}

class _ParcelaTableHeaderWidgetState extends State<ParcelaTableHeaderWidget> {
  late ParcelaTableHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParcelaTableHeaderModel());

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
      height: 93.0,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final plano = widget.plano!.toList();

          return FlutterFlowDataTable<PlanoRow>(
            controller: _model.paginatedDataTableController,
            data: plano,
            columnsBuilder: (onSortChanged) => [
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Plano',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
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
                    'Parcelas',
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
                    'Valor parcela',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Ubuntu',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
            dataRowBuilder:
                (planoItem, planoIndex, selected, onSelectChanged) => DataRow(
              color: WidgetStateProperty.all(
                planoIndex % 2 == 0
                    ? FlutterFlowTheme.of(context).alternate
                    : FlutterFlowTheme.of(context).primaryBackground,
              ),
              cells: [
                Text(
                  valueOrDefault<String>(
                    planoItem.idPedido.toString(),
                    'N/A',
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
                    formatNumber(
                      planoItem.valor,
                      formatType: FormatType.custom,
                      currency: 'R\$',
                      format: '##,#00.00',
                      locale: 'pt',
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
                Text(
                  valueOrDefault<String>(
                    planoItem.numeroParcelas,
                    'N/A',
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
                    formatNumber(
                      planoItem.parcela,
                      formatType: FormatType.custom,
                      currency: 'R\$ ',
                      format: '##,#00.00',
                      locale: 'pt',
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
              ].map((c) => DataCell(c)).toList(),
            ),
            paginated: false,
            selectable: false,
            height: 100.0,
            headingRowHeight: 40.0,
            dataRowHeight: 52.0,
            columnSpacing: 20.0,
            headingRowColor: FlutterFlowTheme.of(context).secondaryBackground,
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
    );
  }
}
