import '/backend/supabase/supabase.dart';
import '/components/parcela_mobile_data_table_body_copy/parcela_mobile_data_table_body_copy_widget.dart';
import '/components/parcela_mobile_table_header/parcela_mobile_table_header_widget.dart';
import '/components/parcela_table_header/parcela_table_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'parcelas_model.dart';
export 'parcelas_model.dart';

class ParcelasWidget extends StatefulWidget {
  const ParcelasWidget({
    super.key,
    required this.token,
  });

  final String? token;

  static String routeName = 'Parcelas';
  static String routePath = '/parcelas/:token';

  @override
  State<ParcelasWidget> createState() => _ParcelasWidgetState();
}

class _ParcelasWidgetState extends State<ParcelasWidget> {
  late ParcelasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParcelasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.planoRecord = await PlanoTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'Token',
          widget.token,
        ),
      );
      if (_model.planoRecord != null && (_model.planoRecord)!.isNotEmpty) {
        _model.pagamento = await PagamentoTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id_plano',
            _model.planoRecord?.firstOrNull?.idPedido,
          ),
        );
      }
      _model.isLoading = false;
      safeSetState(() {});
    });

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Acompanhe as parcelas de seu plano',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).width > 600.0
                            ? 22.0
                            : 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (!_model.isLoading) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController,
                                          child: ExpandablePanel(
                                            header: Builder(
                                              builder: (context) {
                                                if (MediaQuery.sizeOf(context)
                                                        .width >
                                                    50.0) {
                                                  return wrapWithModel(
                                                    model: _model
                                                        .parcelaTableHeaderModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ParcelaTableHeaderWidget(
                                                      plano:
                                                          _model.planoRecord!,
                                                    ),
                                                  );
                                                } else {
                                                  return wrapWithModel(
                                                    model: _model
                                                        .parcelaMobileTableHeaderModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ParcelaMobileTableHeaderWidget(
                                                      plano:
                                                          _model.planoRecord!,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            collapsed: Container(),
                                            expanded: Builder(
                                              builder: (context) {
                                                if (widget.token != null &&
                                                    widget.token != '') {
                                                  return wrapWithModel(
                                                    model: _model
                                                        .parcelaMobileDataTableBodyCopyModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ParcelaMobileDataTableBodyCopyWidget(
                                                      idPlano: _model
                                                          .planoRecord!
                                                          .firstOrNull!
                                                          .idPedido,
                                                      callback: () async {
                                                        safeSetState(() {});
                                                      },
                                                      callback2: () async {},
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: false,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    child: custom_widgets.CustomLoader(
                      width: 40.0,
                      height: 40.0,
                      size: 40.0,
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
