import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/change_plan_status/change_plan_status_widget.dart';
import '/components/comments/comments_widget.dart';
import '/components/create_plan/create_plan_widget.dart';
import '/components/data_table_body/data_table_body_widget.dart';
import '/components/data_table_header/data_table_header_widget.dart';
import '/components/droplist_kanban/droplist_kanban_widget.dart';
import '/components/droplist_sellers/droplist_sellers_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/components/pix_tab_data/pix_tab_data_widget.dart';
import '/components/search_card/search_card_widget.dart';
import '/components_effects/device_box/device_box_widget.dart';
import '/components_effects/dialog_confirm/dialog_confirm_widget.dart';
import '/components_effects/shimmer_search/shimmer_search_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'crm_model.dart';
export 'crm_model.dart';

class CrmWidget extends StatefulWidget {
  const CrmWidget({super.key});

  static String routeName = 'CRM';
  static String routePath = '/crm';

  @override
  State<CrmWidget> createState() => _CrmWidgetState();
}

class _CrmWidgetState extends State<CrmWidget> with TickerProviderStateMixin {
  late CrmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrmModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribe(
        'plano',
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await actions.subscribe(
        'plano',
        () async {
          safeSetState(() => _model.requestCompleter4 = null);
          await _model.waitForRequestCompleted4();
        },
      );
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.enderecoFocusNode ??= FocusNode();

    _model.numeroFocusNode1 ??= FocusNode();

    _model.bairroFocusNode ??= FocusNode();

    _model.complementoFocusNode ??= FocusNode();

    _model.cepFocusNode ??= FocusNode();

    _model.cidadeFocusNode ??= FocusNode();

    _model.estadoFocusNode1 ??= FocusNode();

    _model.emailFocusNode ??= FocusNode();

    _model.cpfFocusNode ??= FocusNode();

    _model.cnhTextController ??= TextEditingController();
    _model.cnhFocusNode ??= FocusNode();

    _model.estadoFocusNode2 ??= FocusNode();

    _model.numeroFocusNode2 ??= FocusNode();

    _model.numeroFocusNode3 ??= FocusNode();

    _model.dataEmissaoFocusNode ??= FocusNode();

    _model.telefoneFocusNode1 ??= FocusNode();

    _model.telefoneFocusNode2 ??= FocusNode();

    _model.pixFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Visibility(
          visible: ((FFAppState().Usuario.role == 2) ||
                  (FFAppState().Usuario.role == 3)) &&
              (_model.tabBarCurrentIndex == 1),
          child: Builder(
            builder: (context) => FloatingActionButton(
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
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(dialogContext).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: CreatePlanWidget(
                            callback: () async {
                              safeSetState(
                                  () => _model.requestCompleter2 = null);
                              await _model.waitForRequestCompleted2();
                              safeSetState(
                                  () => _model.requestCompleter4 = null);
                              await _model.waitForRequestCompleted4();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              elevation: 8.0,
              child: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 28.0,
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 2.0),
                child: wrapWithModel(
                  model: _model.appbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppbarWidget(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 36.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.menubarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenubarWidget(
                          page: 2,
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<LeadRow>>(
                          future: (_model.requestCompleter2 ??=
                                  Completer<List<LeadRow>>()
                                    ..complete(LeadTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        FFAppState().SelectedCRM,
                                      ),
                                    )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return ShimmerSearchWidget();
                            }
                            List<LeadRow> leadLeadRowList = snapshot.data!;

                            final leadLeadRow = leadLeadRowList.isNotEmpty
                                ? leadLeadRowList.first
                                : null;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  custom_widgets.ControllerLeadCRM(
                                    width: 0.0,
                                    height: 0.0,
                                    lead: leadLeadRow,
                                    callback: () async {
                                      safeSetState(() {
                                        _model.emailTextController?.text =
                                            leadLeadRow?.email != null &&
                                                    leadLeadRow?.email != ''
                                                ? leadLeadRow!.email!
                                                : ' ';

                                        _model.cpfTextController?.text =
                                            valueOrDefault<String>(
                                          leadLeadRow?.cpf,
                                          ' Não cadastrado',
                                        );

                                        _model.telefoneTextController1?.text =
                                            valueOrDefault<String>(
                                          leadLeadRow?.telefone,
                                          ' Não cadastrado',
                                        );

                                        _model.bairroTextController?.text =
                                            leadLeadRow?.bairro != null &&
                                                    leadLeadRow?.bairro != ''
                                                ? leadLeadRow!.bairro!
                                                : ' ';

                                        _model.cepTextController?.text =
                                            leadLeadRow?.cep != null &&
                                                    leadLeadRow?.cep != ''
                                                ? leadLeadRow!.cep!
                                                : ' ';

                                        _model.cidadeTextController?.text =
                                            leadLeadRow?.cidade != null &&
                                                    leadLeadRow?.cidade != ''
                                                ? leadLeadRow!.cidade!
                                                : ' ';

                                        _model.estadoTextController1?.text =
                                            leadLeadRow?.uf != null &&
                                                    leadLeadRow?.uf != ''
                                                ? leadLeadRow!.uf!
                                                : ' ';

                                        _model.pixTextController?.text =
                                            leadLeadRow?.chavePix != null &&
                                                    leadLeadRow?.chavePix != ''
                                                ? leadLeadRow!.chavePix!
                                                : ' ';

                                        _model.complementoTextController?.text =
                                            leadLeadRow?.complemento != null &&
                                                    leadLeadRow?.complemento !=
                                                        ''
                                                ? leadLeadRow!.complemento!
                                                : ' ';

                                        _model.textController2?.text =
                                            valueOrDefault<String>(
                                          leadLeadRow?.nome,
                                          ' Sem Nome',
                                        );

                                        _model.telefoneTextController2?.text =
                                            leadLeadRow?.telefone2 != null &&
                                                    leadLeadRow?.telefone2 != ''
                                                ? leadLeadRow!.telefone2!
                                                : ' ';

                                        _model.textController1?.clear();
                                        _model.enderecoTextController?.text =
                                            leadLeadRow?.endereco != null &&
                                                    leadLeadRow?.endereco != ''
                                                ? leadLeadRow!.endereco!
                                                : ' ';

                                        _model.numeroTextController1?.text =
                                            leadLeadRow?.numero != null &&
                                                    leadLeadRow?.numero != ''
                                                ? leadLeadRow!.numero!
                                                : ' ';
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 200.0,
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode1,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController1',
                                                Duration(milliseconds: 0),
                                                () async {
                                                  _model.busca =
                                                      await SupabaseGroup
                                                          .buscaLeadCall
                                                          .call(
                                                    busca: _model
                                                        .textController1.text,
                                                  );

                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: 'Buscar',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                suffixIcon: Icon(
                                                  Icons.search,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.textController1.text ==
                                                      '') {
                                                return Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(8.0),
                                                      topRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: double.infinity,
                                                      child: custom_widgets
                                                          .ListViewPaginationCRMCards(
                                                        width: 200.0,
                                                        height: double.infinity,
                                                        list: FFAppState()
                                                            .CrmCards,
                                                        selectedItem:
                                                            FFAppState()
                                                                .SelectedCRM,
                                                        callbackApi: () async {
                                                          if (FFAppState()
                                                              .CrmCards
                                                              .isNotEmpty) {
                                                            FFAppState().Ini =
                                                                FFAppState()
                                                                        .Ini +
                                                                    31;
                                                            FFAppState().Fim =
                                                                FFAppState()
                                                                        .Fim +
                                                                    30;
                                                            _model.paginacao =
                                                                await SupabaseGroup
                                                                    .paginacaoLeadsCall
                                                                    .call(
                                                              ini: FFAppState()
                                                                  .Ini,
                                                              fim: FFAppState()
                                                                  .Fim,
                                                            );

                                                            if ((_model
                                                                    .paginacao
                                                                    ?.succeeded ??
                                                                true)) {
                                                              FFAppState().CrmCards = functions
                                                                  .addList(
                                                                      FFAppState()
                                                                          .CrmCards
                                                                          .toList(),
                                                                      ((_model.paginacao?.jsonBody ?? '')
                                                                              .toList()
                                                                              .map<SearchsCardsStruct?>(SearchsCardsStruct.maybeFromMap)
                                                                              .toList() as Iterable<SearchsCardsStruct?>)
                                                                          .withoutNulls
                                                                          .toList())!
                                                                  .toList()
                                                                  .cast<SearchsCardsStruct>();
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            _model.paginacaoIni =
                                                                await SupabaseGroup
                                                                    .paginacaoLeadsCall
                                                                    .call(
                                                              ini: FFAppState()
                                                                  .Ini,
                                                              fim: FFAppState()
                                                                  .Fim,
                                                            );

                                                            if ((_model
                                                                    .paginacaoIni
                                                                    ?.succeeded ??
                                                                true)) {
                                                              FFAppState().CrmCards = functions
                                                                  .addList(
                                                                      FFAppState()
                                                                          .CrmCards
                                                                          .toList(),
                                                                      ((_model.paginacaoIni?.jsonBody ?? '')
                                                                              .toList()
                                                                              .map<SearchsCardsStruct?>(SearchsCardsStruct.maybeFromMap)
                                                                              .toList() as Iterable<SearchsCardsStruct?>)
                                                                          .withoutNulls
                                                                          .toList())!
                                                                  .toList()
                                                                  .cast<SearchsCardsStruct>();
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        itemCallback:
                                                            (selected) async {
                                                          FFAppState()
                                                                  .SelectedCRM =
                                                              selected;
                                                          safeSetState(() {});
                                                          await Future.wait([
                                                            Future(() async {
                                                              safeSetState(() =>
                                                                  _model.requestCompleter1 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted1();
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() =>
                                                                  _model.requestCompleter2 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted2();
                                                            }),
                                                            Future(() async {
                                                              safeSetState(() =>
                                                                  _model.requestCompleter4 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted4();
                                                            }),
                                                          ]);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Container(
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(8.0),
                                                      topRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 200.0,
                                                    child: Builder(
                                                      builder: (context) {
                                                        final buscaLeads = ((_model
                                                                            .busca
                                                                            ?.jsonBody ??
                                                                        '')
                                                                    .toList()
                                                                    .map<SearchLeadStruct?>(
                                                                        SearchLeadStruct
                                                                            .maybeFromMap)
                                                                    .toList() as Iterable<SearchLeadStruct?>)
                                                                .withoutNulls
                                                                .toList() ??
                                                            [];

                                                        return ListView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            5.0,
                                                            0,
                                                            15.0,
                                                          ),
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              buscaLeads.length,
                                                          itemBuilder: (context,
                                                              buscaLeadsIndex) {
                                                            final buscaLeadsItem =
                                                                buscaLeads[
                                                                    buscaLeadsIndex];
                                                            return SearchCardWidget(
                                                              key: Key(
                                                                  'Keyth9_${buscaLeadsIndex}_of_${buscaLeads.length}'),
                                                              nome:
                                                                  buscaLeadsItem
                                                                      .nome,
                                                              cpf:
                                                                  buscaLeadsItem
                                                                      .cpf,
                                                              etapa:
                                                                  buscaLeadsItem
                                                                      .etapa,
                                                              updatedAt:
                                                                  buscaLeadsItem
                                                                      .updatedAt,
                                                              id: buscaLeadsItem
                                                                  .id,
                                                              selectedItem:
                                                                  FFAppState()
                                                                      .SelectedCRM,
                                                              callback:
                                                                  (selected) async {
                                                                FFAppState()
                                                                        .SelectedCRM =
                                                                    selected;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                safeSetState(() =>
                                                                    _model.requestCompleter2 =
                                                                        null);
                                                                safeSetState(() =>
                                                                    _model.requestCompleter4 =
                                                                        null);
                                                                safeSetState(() =>
                                                                    _model.requestCompleter3 =
                                                                        null);
                                                                safeSetState(() =>
                                                                    _model.requestCompleter1 =
                                                                        null);
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    leadLeadRow?.id != null,
                                    false,
                                  ))
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: FlutterFlowButtonTabBar(
                                                useToggleButtonStyle: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                unselectedLabelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                unselectedBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                unselectedBorderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                borderWidth: 1.0,
                                                borderRadius: 8.0,
                                                elevation: 0.0,
                                                buttonMargin:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 8.0, 0.0),
                                                tabs: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .insert_comment_rounded,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text: 'Cadastro',
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .smartphone_outlined,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text: 'Plano',
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .folderOpen,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text: 'Anexos',
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.attach_money,
                                                      ),
                                                      Tab(
                                                        text: 'Pix',
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          FFIcons
                                                              .kcapturaDeTela20241204113659RemovebgPreview1,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text: 'Palenca',
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          FFIcons
                                                              .kwhatsappImage20250201At191218,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text: 'CCB',
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {},
                                                    () async {},
                                                    () async {},
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: [
                                                  Stack(
                                                    children: [
                                                      SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController2 ??= TextEditingController(
                                                                                text: valueOrDefault<String>(
                                                                                  leadLeadRow?.nome,
                                                                                  ' Sem Nome',
                                                                                ),
                                                                              ),
                                                                              focusNode: _model.textFieldFocusNode2,
                                                                              autofocus: false,
                                                                              readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                hintText: 'TextField',
                                                                                enabledBorder: InputBorder.none,
                                                                                focusedBorder: InputBorder.none,
                                                                                errorBorder: InputBorder.none,
                                                                                focusedErrorBorder: InputBorder.none,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Ubuntu',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 24.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              validator: _model.textController2Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Data de criação:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Ubuntu',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          "dd/MM/yyyy H:mm",
                                                                          leadLeadRow!
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Ubuntu',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            5.0)),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if ((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)) {
                                                                                      await showAlignedDialog(
                                                                                        context: context,
                                                                                        isGlobal: false,
                                                                                        avoidOverflow: false,
                                                                                        targetAnchor: AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                                        followerAnchor: AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                                        builder: (dialogContext) {
                                                                                          return Material(
                                                                                            color: Colors.transparent,
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: DroplistKanbanWidget(),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      borderRadius: BorderRadius.circular(32.0),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: Text(
                                                                                        leadLeadRow.etapa!,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Ubuntu',
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if ((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)) {
                                                                                      await showAlignedDialog(
                                                                                        context: context,
                                                                                        isGlobal: false,
                                                                                        avoidOverflow: false,
                                                                                        targetAnchor: AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                                        followerAnchor: AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                                        builder: (dialogContext) {
                                                                                          return Material(
                                                                                            color: Colors.transparent,
                                                                                            child: WebViewAware(
                                                                                              child: GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: DroplistSellersWidget(),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                      safeSetState(() => _model.requestCompleter2 = null);
                                                                                      await _model.waitForRequestCompleted2();
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        leadLeadRow.cor != null && leadLeadRow.cor != ''
                                                                                            ? colorFromCssString(
                                                                                                leadLeadRow.cor!,
                                                                                                defaultColor: Colors.black,
                                                                                              )
                                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                                        FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(32.0),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              leadLeadRow.responsavel,
                                                                                              'Add Colaborador',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Ubuntu',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 25.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 2.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Blacklist',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Ubuntu',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Switch.adaptive(
                                                                                    value: _model.blacklistValue1 ??= leadLeadRow.blacklist!,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.blacklistValue1 = newValue);
                                                                                      if (newValue) {
                                                                                        await LeadTable().update(
                                                                                          data: {
                                                                                            'Blacklist': true,
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            leadLeadRow.id,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        await LeadTable().update(
                                                                                          data: {
                                                                                            'Blacklist': false,
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            leadLeadRow.id,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                    activeTrackColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                    inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 25.0,
                                                                                    child: VerticalDivider(
                                                                                      thickness: 2.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Proibido Adiar',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Ubuntu',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Switch.adaptive(
                                                                                    value: _model.blacklistValue2 ??= leadLeadRow.proibidoAdiar!,
                                                                                    onChanged: (newValue) async {
                                                                                      safeSetState(() => _model.blacklistValue2 = newValue);
                                                                                      if (newValue) {
                                                                                        await LeadTable().update(
                                                                                          data: {
                                                                                            'Proibido Adiar': true,
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            leadLeadRow.id,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        await LeadTable().update(
                                                                                          data: {
                                                                                            'Proibido Adiar': false,
                                                                                          },
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id',
                                                                                            leadLeadRow.id,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).tertiary,
                                                                                    activeTrackColor: FlutterFlowTheme.of(context).error,
                                                                                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                    inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3))
                                                                                    ? null
                                                                                    : () async {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: DialogConfirmWidget(
                                                                                                    mensagem: 'Tem certeza que deseja excluir o cliente?',
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() => _model.response = value));

                                                                                        if (_model.response!) {
                                                                                          await LeadTable().delete(
                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                              'id',
                                                                                              FFAppState().SelectedCRM,
                                                                                            ),
                                                                                          );
                                                                                          safeSetState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                          FFAppState().CrmCards = functions.updateCrmCards(FFAppState().CrmCards.toList(), leadLeadRow.id).toList().cast<SearchsCardsStruct>();
                                                                                          FFAppState().update(() {});
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Registo excluído',
                                                                                                style: TextStyle(
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                text: 'Excluir',
                                                                                options: FFButtonOptions(
                                                                                  width: 120.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Ubuntu',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                  disabledColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 20.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 15.0)),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Text(
                                                                                'Endereço',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Divider(
                                                                              thickness: 2.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          'Rua',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 550.0,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: TextFormField(
                                                                                            controller: _model.enderecoTextController ??= TextEditingController(
                                                                                              text: leadLeadRow.endereco != null && leadLeadRow.endereco != '' ? leadLeadRow.endereco : ' ',
                                                                                            ),
                                                                                            focusNode: _model.enderecoFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.enderecoTextController',
                                                                                              Duration(milliseconds: 2000),
                                                                                              () async {
                                                                                                await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                await LeadTable().update(
                                                                                                  data: {
                                                                                                    'endereco': _model.enderecoTextController.text,
                                                                                                  },
                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                    'id',
                                                                                                    FFAppState().SelectedCRM,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Ubuntu',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.enderecoTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            'Número',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Ubuntu',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: 80.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                              child: TextFormField(
                                                                                                controller: _model.numeroTextController1 ??= TextEditingController(
                                                                                                  text: leadLeadRow.numero != null && leadLeadRow.numero != '' ? leadLeadRow.numero : ' ',
                                                                                                ),
                                                                                                focusNode: _model.numeroFocusNode1,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.numeroTextController1',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'numero': _model.numeroTextController1.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.numeroTextController1Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Bairro',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            child: TextFormField(
                                                                                              controller: _model.bairroTextController ??= TextEditingController(
                                                                                                text: leadLeadRow.bairro != null && leadLeadRow.bairro != '' ? leadLeadRow.bairro : ' ',
                                                                                              ),
                                                                                              focusNode: _model.bairroFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.bairroTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () async {
                                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                  await LeadTable().update(
                                                                                                    data: {
                                                                                                      'bairro': _model.bairroTextController.text,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      FFAppState().SelectedCRM,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.bairroTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 5.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Complemento',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            child: TextFormField(
                                                                                              controller: _model.complementoTextController ??= TextEditingController(
                                                                                                text: leadLeadRow.complemento != null && leadLeadRow.complemento != '' ? leadLeadRow.complemento : ' ',
                                                                                              ),
                                                                                              focusNode: _model.complementoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.complementoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () async {
                                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                  await LeadTable().update(
                                                                                                    data: {
                                                                                                      'complemento': _model.complementoTextController.text,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      FFAppState().SelectedCRM,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.complementoTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 5.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Cep',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            child: TextFormField(
                                                                                              controller: _model.cepTextController ??= TextEditingController(
                                                                                                text: leadLeadRow.cep != null && leadLeadRow.cep != '' ? leadLeadRow.cep : ' ',
                                                                                              ),
                                                                                              focusNode: _model.cepFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.cepTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () async {
                                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                  await LeadTable().update(
                                                                                                    data: {
                                                                                                      'cep': _model.cepTextController.text,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      FFAppState().SelectedCRM,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.cepTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 5.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 30.0)),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 300.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'Cidade',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          child: TextFormField(
                                                                                            controller: _model.cidadeTextController ??= TextEditingController(
                                                                                              text: leadLeadRow.cidade != null && leadLeadRow.cidade != '' ? leadLeadRow.cidade : ' ',
                                                                                            ),
                                                                                            focusNode: _model.cidadeFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.cidadeTextController',
                                                                                              Duration(milliseconds: 2000),
                                                                                              () async {
                                                                                                await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                await LeadTable().update(
                                                                                                  data: {
                                                                                                    'cidade': _model.cidadeTextController.text,
                                                                                                  },
                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                    'id',
                                                                                                    FFAppState().SelectedCRM,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Ubuntu',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.cidadeTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 5.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: 320.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Text(
                                                                                            'Estado',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Ubuntu',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          width: double.infinity,
                                                                                          child: TextFormField(
                                                                                            controller: _model.estadoTextController1 ??= TextEditingController(
                                                                                              text: leadLeadRow.uf != null && leadLeadRow.uf != '' ? leadLeadRow.uf : ' ',
                                                                                            ),
                                                                                            focusNode: _model.estadoFocusNode1,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.estadoTextController1',
                                                                                              Duration(milliseconds: 2000),
                                                                                              () async {
                                                                                                await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                await LeadTable().update(
                                                                                                  data: {
                                                                                                    'uf': _model.estadoTextController1.text,
                                                                                                  },
                                                                                                  matchingRows: (rows) => rows.eqOrNull(
                                                                                                    'id',
                                                                                                    FFAppState().SelectedCRM,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              isDense: true,
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: Color(0x00000000),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              filled: true,
                                                                                              fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Ubuntu',
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.estadoTextController1Validator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 5.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 30.0)),
                                                                            ),
                                                                          ].addToStart(SizedBox(height: 20.0)),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Text(
                                                                                  'Dados cadastrais',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Ubuntu',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Divider(
                                                                                thickness: 2.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'E-mail',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.emailTextController ??= TextEditingController(
                                                                                                  text: leadLeadRow.email != null && leadLeadRow.email != '' ? leadLeadRow.email : ' ',
                                                                                                ),
                                                                                                focusNode: _model.emailFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.emailTextController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'email': _model.emailTextController.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.emailTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'CPF',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.cpfTextController ??= TextEditingController(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    leadLeadRow.cpf,
                                                                                                    ' Não cadastrado',
                                                                                                  ),
                                                                                                ),
                                                                                                focusNode: _model.cpfFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.cpfTextController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'cpf': _model.cpfTextController.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: true,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.cpfTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 30.0)),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'CNH',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.cnhTextController,
                                                                                                focusNode: _model.cnhFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.cnhTextController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'email': _model.cnhTextController.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.cnhTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'Emissor',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.estadoTextController2 ??= TextEditingController(
                                                                                                  text: leadLeadRow.emissorCnh != null && leadLeadRow.emissorCnh != '' ? leadLeadRow.emissorCnh : ' ',
                                                                                                ),
                                                                                                focusNode: _model.estadoFocusNode2,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.estadoTextController2',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'cpf': _model.estadoTextController2.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: true,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.estadoTextController2Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'Estado',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.numeroTextController2 ??= TextEditingController(
                                                                                                  text: leadLeadRow.estadoCnh != null && leadLeadRow.estadoCnh != '' ? leadLeadRow.estadoCnh : ' ',
                                                                                                ),
                                                                                                focusNode: _model.numeroFocusNode2,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.numeroTextController2',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'cpf': _model.numeroTextController2.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: true,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.numeroTextController2Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 30.0)),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 300.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Número',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            child: TextFormField(
                                                                                              controller: _model.numeroTextController3 ??= TextEditingController(
                                                                                                text: leadLeadRow.numeroCnh != null && leadLeadRow.numeroCnh != '' ? leadLeadRow.numeroCnh : ' ',
                                                                                              ),
                                                                                              focusNode: _model.numeroFocusNode3,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.numeroTextController3',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () async {
                                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                  await LeadTable().update(
                                                                                                    data: {
                                                                                                      'email': _model.numeroTextController3.text,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      FFAppState().SelectedCRM,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.numeroTextController3Validator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 5.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 300.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Text(
                                                                                              'Data de emissão',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: double.infinity,
                                                                                            child: TextFormField(
                                                                                              controller: _model.dataEmissaoTextController ??= TextEditingController(
                                                                                                text: leadLeadRow.dataDeEmissao != null ? leadLeadRow.dataDeEmissao?.toString() : ' ',
                                                                                              ),
                                                                                              focusNode: _model.dataEmissaoFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.dataEmissaoTextController',
                                                                                                Duration(milliseconds: 2000),
                                                                                                () async {
                                                                                                  await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                  await LeadTable().update(
                                                                                                    data: {
                                                                                                      'cpf': _model.dataEmissaoTextController.text,
                                                                                                    },
                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                      'id',
                                                                                                      FFAppState().SelectedCRM,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              readOnly: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: true,
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                filled: true,
                                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Ubuntu',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.dataEmissaoTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 5.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 30.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Text(
                                                                                  'Contato',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Ubuntu',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Divider(
                                                                                thickness: 2.0,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Whatsapp',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Ubuntu',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await launchURL('https://wa.me/${leadLeadRow.telefone}');
                                                                                                    },
                                                                                                    child: FaIcon(
                                                                                                      FontAwesomeIcons.whatsapp,
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.telefoneTextController1 ??= TextEditingController(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    leadLeadRow.telefone,
                                                                                                    ' Não cadastrado',
                                                                                                  ),
                                                                                                ),
                                                                                                focusNode: _model.telefoneFocusNode1,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.telefoneTextController1',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'telefone': _model.telefoneTextController1.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.telefoneTextController1Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Whatsapp 2',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Ubuntu',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await launchURL('https://wa.me/${leadLeadRow.telefone2}');
                                                                                                    },
                                                                                                    child: FaIcon(
                                                                                                      FontAwesomeIcons.whatsapp,
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.telefoneTextController2 ??= TextEditingController(
                                                                                                  text: leadLeadRow.telefone2 != null && leadLeadRow.telefone2 != '' ? leadLeadRow.telefone2 : ' ',
                                                                                                ),
                                                                                                focusNode: _model.telefoneFocusNode2,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.telefoneTextController2',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'Telefone2': _model.telefoneTextController2.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.telefoneTextController2Validator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                              child: Text(
                                                                                                'Chave Pix',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              child: TextFormField(
                                                                                                controller: _model.pixTextController ??= TextEditingController(
                                                                                                  text: leadLeadRow.chavePix != null && leadLeadRow.chavePix != '' ? leadLeadRow.chavePix : ' ',
                                                                                                ),
                                                                                                focusNode: _model.pixFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.pixTextController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    await Future.delayed(const Duration(milliseconds: 1000));
                                                                                                    await LeadTable().update(
                                                                                                      data: {
                                                                                                        'chave_pix': _model.pixTextController.text,
                                                                                                      },
                                                                                                      matchingRows: (rows) => rows.eqOrNull(
                                                                                                        'id',
                                                                                                        FFAppState().SelectedCRM,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                readOnly: !((FFAppState().Usuario.role == 2) || (FFAppState().Usuario.role == 3)),
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.pixTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 30.0)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Text(
                                                                                      'Links',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Ubuntu',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Divider(
                                                                                    thickness: 2.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                30.0,
                                                                            fillColor:
                                                                                Color(0xFF492065),
                                                                            hoverColor:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            hoverIconColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.copy,
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 12.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              await Clipboard.setData(ClipboardData(text: leadLeadRow.linkIndicacao!));
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Copiado com sucesso !!!',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      fontSize: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Indicação',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Ubuntu',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            25.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showAlignedDialog(
                                                                context:
                                                                    context,
                                                                isGlobal: false,
                                                                avoidOverflow:
                                                                    false,
                                                                targetAnchor:
                                                                    AlignmentDirectional(
                                                                            1.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                followerAnchor:
                                                                    AlignmentDirectional(
                                                                            1.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              550.0,
                                                                          width:
                                                                              370.0,
                                                                          child:
                                                                              CommentsWidget(
                                                                            leadId:
                                                                                FFAppState().SelectedCRM,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 150.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            80.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Transform
                                                                    .rotate(
                                                                  angle: 270.0 *
                                                                      (math.pi /
                                                                          180),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidCommentDots,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Text(
                                                                          'Comentários',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Ubuntu',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  FutureBuilder<List<PlanoRow>>(
                                                    future: (_model
                                                                .requestCompleter4 ??=
                                                            Completer<
                                                                List<
                                                                    PlanoRow>>()
                                                              ..complete(
                                                                  PlanoTable()
                                                                      .queryRows(
                                                                queryFn: (q) => q
                                                                    .eqOrNull(
                                                                      'lead_id',
                                                                      FFAppState()
                                                                          .SelectedCRM,
                                                                    )
                                                                    .order('created_at'),
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return ShimmerSearchWidget();
                                                      }
                                                      List<PlanoRow>
                                                          planoPlanoRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child: Stack(
                                                            children: [
                                                              SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            leadLeadRow.nome,
                                                                                            ' Sem Nome',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).displayLarge.override(
                                                                                                fontFamily: 'Ubuntu',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Container(
                                                                                            height: 20.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: planoPlanoRowList.where((e) => e.ativo == true).toList().length > 0 ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).secondaryText,
                                                                                              borderRadius: BorderRadius.circular(31.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 2.0, 15.0, 2.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  planoPlanoRowList.where((e) => e.ativo == true).toList().length > 0 ? 'Ativo' : 'Inativo',
                                                                                                  'Inativo',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Ubuntu',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Data de criação:',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Ubuntu',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          "dd/MM/yyyy H:mm",
                                                                                          leadLeadRow.createdAt,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Ubuntu',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              if (planoPlanoRowList.isNotEmpty)
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    height: 88.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final planoList = functions.getDeviceList(planoPlanoRowList.toList()).toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.horizontal,
                                                                                            itemCount: planoList.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(width: 5.0),
                                                                                            itemBuilder: (context, planoListIndex) {
                                                                                              final planoListItem = planoList[planoListIndex];
                                                                                              return DeviceBoxWidget(
                                                                                                key: Key('Keys36_${planoListIndex}_of_${planoList.length}'),
                                                                                                deviceId: planoListItem,
                                                                                                onRefresh: () async {},
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
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Planos',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                2.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final plano = planoPlanoRowList.toList();

                                                                              return ListView.separated(
                                                                                padding: EdgeInsets.fromLTRB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  15.0,
                                                                                ),
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: plano.length,
                                                                                separatorBuilder: (_, __) => SizedBox(height: 30.0),
                                                                                itemBuilder: (context, planoIndex) {
                                                                                  final planoItem = plano[planoIndex];
                                                                                  return Container(
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      color: Color(0x00000000),
                                                                                      child: ExpandableNotifier(
                                                                                        initialExpanded: false,
                                                                                        child: ExpandablePanel(
                                                                                          header: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        context.pushNamed(
                                                                                                          ParcelasWidget.routeName,
                                                                                                          pathParameters: {
                                                                                                            'token': serializeParam(
                                                                                                              planoItem.token,
                                                                                                              ParamType.String,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                          borderRadius: BorderRadius.circular(32.0),
                                                                                                        ),
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                                                                                                          child: Text(
                                                                                                            planoItem.idPedido.toString(),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Ubuntu',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Builder(
                                                                                                      builder: (context) => Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
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
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                    child: WebViewAware(
                                                                                                                      child: GestureDetector(
                                                                                                                        onTap: () {
                                                                                                                          FocusScope.of(dialogContext).unfocus();
                                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                        },
                                                                                                                        child: ChangePlanStatusWidget(
                                                                                                                          line: planoItem,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            }
                                                                                                          },
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: planoItem.ativo! ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).error,
                                                                                                              borderRadius: BorderRadius.circular(32.0),
                                                                                                            ),
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                                                                                                              child: Text(
                                                                                                                planoItem.ativo! ? 'Ativo' : 'Inativo',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Ubuntu',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                      child: FutureBuilder<List<UsuariosRow>>(
                                                                                                        future: (_model.requestCompleter3 ??= Completer<List<UsuariosRow>>()
                                                                                                              ..complete(UsuariosTable().querySingleRow(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'uuid',
                                                                                                                  planoItem.vendedorId,
                                                                                                                ),
                                                                                                              )))
                                                                                                            .future,
                                                                                                        builder: (context, snapshot) {
                                                                                                          // Customize what your widget looks like when it's loading.
                                                                                                          if (!snapshot.hasData) {
                                                                                                            return Container(
                                                                                                              width: 30.0,
                                                                                                              height: 30.0,
                                                                                                              child: ShimmerSearchWidget(),
                                                                                                            );
                                                                                                          }
                                                                                                          List<UsuariosRow> userUsuariosRowList = snapshot.data!;

                                                                                                          final userUsuariosRow = userUsuariosRowList.isNotEmpty ? userUsuariosRowList.first : null;

                                                                                                          return Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: colorFromCssString(
                                                                                                                userUsuariosRow!.cor!,
                                                                                                                defaultColor: Colors.black,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(32.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 3.0),
                                                                                                                child: Text(
                                                                                                                  userUsuariosRow.nome!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Ubuntu',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        fontSize: 16.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                            child: Text(
                                                                                                              formatNumber(
                                                                                                                planoItem.valor!,
                                                                                                                formatType: FormatType.decimal,
                                                                                                                decimalType: DecimalType.commaDecimal,
                                                                                                                currency: 'R\$ ',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Ubuntu',
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              DataTableHeaderWidget(
                                                                                                key: Key('Keyt9i_${planoIndex}_of_${plano.length}'),
                                                                                                parameter1: planoPlanoRowList.where((e) => e.idPedido == planoItem.idPedido).toList(),
                                                                                                leadId: leadLeadRow.id,
                                                                                                callback: () async {
                                                                                                  safeSetState(() => _model.requestCompleter4 = null);
                                                                                                  await _model.waitForRequestCompleted4();
                                                                                                  safeSetState(() => _model.requestCompleter2 = null);
                                                                                                  await _model.waitForRequestCompleted2();
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          collapsed: Container(),
                                                                                          expanded: DataTableBodyWidget(
                                                                                            key: Key('Key27e_${planoIndex}_of_${plano.length}'),
                                                                                            idPlano: planoItem.idPedido,
                                                                                            leadId: leadLeadRow.id,
                                                                                            refreshCallback: () async {
                                                                                              safeSetState(() => _model.requestCompleter4 = null);
                                                                                              await _model.waitForRequestCompleted4();

                                                                                              safeSetState(() {});

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                          theme: ExpandableThemeData(
                                                                                            tapHeaderToExpand: false,
                                                                                            tapBodyToExpand: false,
                                                                                            tapBodyToCollapse: false,
                                                                                            headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                            hasIcon: true,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ].addToEnd(SizedBox(height: 25.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            false,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(1.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(1.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Container(
                                                                                  height: 550.0,
                                                                                  width: 370.0,
                                                                                  child: CommentsWidget(
                                                                                    leadId: FFAppState().SelectedCRM,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            80.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: Transform
                                                                            .rotate(
                                                                          angle:
                                                                              270.0 * (math.pi / 180),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.solidCommentDots,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Text(
                                                                                  'Comentários',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Ubuntu',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  FutureBuilder<
                                                      List<AnexosLeadRow>>(
                                                    future: (_model
                                                                .requestCompleter1 ??=
                                                            Completer<
                                                                List<
                                                                    AnexosLeadRow>>()
                                                              ..complete(
                                                                  AnexosLeadTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.eqOrNull(
                                                                  'lead_id',
                                                                  FFAppState()
                                                                      .SelectedCRM,
                                                                ),
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return ShimmerSearchWidget();
                                                      }
                                                      List<AnexosLeadRow>
                                                          anexosAnexosLeadRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showAlignedDialog(
                                                                      context:
                                                                          context,
                                                                      isGlobal:
                                                                          false,
                                                                      avoidOverflow:
                                                                          false,
                                                                      targetAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      followerAnchor: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: 550.0,
                                                                                width: 370.0,
                                                                                child: CommentsWidget(
                                                                                  leadId: FFAppState().SelectedCRM,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        150.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          80.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: Transform
                                                                          .rotate(
                                                                        angle: 270.0 *
                                                                            (math.pi /
                                                                                180),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.solidCommentDots,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                'Comentários',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          50.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          leadLeadRow
                                                                              .nome,
                                                                          ' Sem Nome',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displayLarge
                                                                            .override(
                                                                              fontFamily: 'Ubuntu',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Data de criação:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Ubuntu',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "dd/MM/yyyy H:mm",
                                                                            leadLeadRow.createdAt,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Ubuntu',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 5.0)),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Anexos',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Ubuntu',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          thickness:
                                                                              2.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ].addToStart(
                                                                              SizedBox(height: 20.0)),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children:
                                                                            [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Comprovantes',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                width: 180.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final comprovantes = anexosAnexosLeadRowList.where((e) => e.tipo == 'comprovante').toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: comprovantes.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                            itemBuilder: (context, comprovantesIndex) {
                                                                                              final comprovantesItem = comprovantes[comprovantesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(comprovantesItem.url!);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 120.0,
                                                                                                  child: custom_widgets.PreviewFile(
                                                                                                    width: double.infinity,
                                                                                                    height: 120.0,
                                                                                                    url: comprovantesItem.url!,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 10.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            final selectedFiles = await selectFiles(
                                                                                              storageFolderPath: '${leadLeadRow.id.toString()}/',
                                                                                              multiFile: false,
                                                                                            );
                                                                                            if (selectedFiles != null) {
                                                                                              safeSetState(() => _model.isDataUploading1 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                selectedUploadedFiles = selectedFiles
                                                                                                    .map((m) => FFUploadedFile(
                                                                                                          name: m.storagePath.split('/').last,
                                                                                                          bytes: m.bytes,
                                                                                                        ))
                                                                                                    .toList();

                                                                                                downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                  bucketName: 'Anexos',
                                                                                                  selectedFiles: selectedFiles,
                                                                                                );
                                                                                              } finally {
                                                                                                _model.isDataUploading1 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                                                                                });
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            if (_model.uploadedFileUrl1 != '') {
                                                                                              await AnexosLeadTable().insert({
                                                                                                'lead_id': leadLeadRow.id,
                                                                                                'tipo': 'comprovante',
                                                                                                'url': _model.uploadedFileUrl1,
                                                                                              });
                                                                                              safeSetState(() => _model.requestCompleter1 = null);
                                                                                              await _model.waitForRequestCompleted1();
                                                                                            }
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.file_upload_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 32.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'CNH',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                width: 180.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final comprovantes = anexosAnexosLeadRowList.where((e) => e.tipo == 'cnh').toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: comprovantes.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                            itemBuilder: (context, comprovantesIndex) {
                                                                                              final comprovantesItem = comprovantes[comprovantesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(comprovantesItem.url!);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 120.0,
                                                                                                  child: custom_widgets.PreviewFile(
                                                                                                    width: double.infinity,
                                                                                                    height: 120.0,
                                                                                                    url: comprovantesItem.url!,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 10.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            final selectedFiles = await selectFiles(
                                                                                              storageFolderPath: '${leadLeadRow.id.toString()}/',
                                                                                              multiFile: false,
                                                                                            );
                                                                                            if (selectedFiles != null) {
                                                                                              safeSetState(() => _model.isDataUploading2 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                selectedUploadedFiles = selectedFiles
                                                                                                    .map((m) => FFUploadedFile(
                                                                                                          name: m.storagePath.split('/').last,
                                                                                                          bytes: m.bytes,
                                                                                                        ))
                                                                                                    .toList();

                                                                                                downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                  bucketName: 'Anexos',
                                                                                                  selectedFiles: selectedFiles,
                                                                                                );
                                                                                              } finally {
                                                                                                _model.isDataUploading2 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                                });
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            if (_model.uploadedFileUrl2 != '') {
                                                                                              await AnexosLeadTable().insert({
                                                                                                'lead_id': leadLeadRow.id,
                                                                                                'tipo': 'cnh',
                                                                                                'url': _model.uploadedFileUrl2,
                                                                                              });
                                                                                              safeSetState(() => _model.requestCompleter1 = null);
                                                                                              await _model.waitForRequestCompleted1();
                                                                                            }
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.file_upload_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 32.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Documentos',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                width: 180.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final comprovantes = anexosAnexosLeadRowList.where((e) => e.tipo == 'documento').toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: comprovantes.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                            itemBuilder: (context, comprovantesIndex) {
                                                                                              final comprovantesItem = comprovantes[comprovantesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(comprovantesItem.url!);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 120.0,
                                                                                                  child: custom_widgets.PreviewFile(
                                                                                                    width: double.infinity,
                                                                                                    height: 120.0,
                                                                                                    url: comprovantesItem.url!,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 10.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            final selectedFiles = await selectFiles(
                                                                                              storageFolderPath: '${leadLeadRow.id.toString()}/',
                                                                                              multiFile: false,
                                                                                            );
                                                                                            if (selectedFiles != null) {
                                                                                              safeSetState(() => _model.isDataUploading3 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                selectedUploadedFiles = selectedFiles
                                                                                                    .map((m) => FFUploadedFile(
                                                                                                          name: m.storagePath.split('/').last,
                                                                                                          bytes: m.bytes,
                                                                                                        ))
                                                                                                    .toList();

                                                                                                downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                  bucketName: 'Anexos',
                                                                                                  selectedFiles: selectedFiles,
                                                                                                );
                                                                                              } finally {
                                                                                                _model.isDataUploading3 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFile3 = selectedUploadedFiles.first;
                                                                                                  _model.uploadedFileUrl3 = downloadUrls.first;
                                                                                                });
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            if (_model.uploadedFileUrl3 != '') {
                                                                                              await AnexosLeadTable().insert({
                                                                                                'lead_id': leadLeadRow.id,
                                                                                                'tipo': 'documento',
                                                                                                'url': _model.uploadedFileUrl3,
                                                                                              });
                                                                                              safeSetState(() => _model.requestCompleter1 = null);
                                                                                              await _model.waitForRequestCompleted1();
                                                                                            }
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.file_upload_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 32.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                'Contratos',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Ubuntu',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                              Container(
                                                                                width: 180.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final comprovantes = anexosAnexosLeadRowList.where((e) => e.tipo == 'contrato').toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: comprovantes.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                                            itemBuilder: (context, comprovantesIndex) {
                                                                                              final comprovantesItem = comprovantes[comprovantesIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await launchURL(comprovantesItem.url!);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 120.0,
                                                                                                  child: custom_widgets.PreviewFile(
                                                                                                    width: double.infinity,
                                                                                                    height: 120.0,
                                                                                                    url: comprovantesItem.url!,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 10.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            final selectedFiles = await selectFiles(
                                                                                              storageFolderPath: '${leadLeadRow.id.toString()}/',
                                                                                              multiFile: false,
                                                                                            );
                                                                                            if (selectedFiles != null) {
                                                                                              safeSetState(() => _model.isDataUploading4 = true);
                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                              var downloadUrls = <String>[];
                                                                                              try {
                                                                                                selectedUploadedFiles = selectedFiles
                                                                                                    .map((m) => FFUploadedFile(
                                                                                                          name: m.storagePath.split('/').last,
                                                                                                          bytes: m.bytes,
                                                                                                        ))
                                                                                                    .toList();

                                                                                                downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                  bucketName: 'Anexos',
                                                                                                  selectedFiles: selectedFiles,
                                                                                                );
                                                                                              } finally {
                                                                                                _model.isDataUploading4 = false;
                                                                                              }
                                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                                safeSetState(() {
                                                                                                  _model.uploadedLocalFile4 = selectedUploadedFiles.first;
                                                                                                  _model.uploadedFileUrl4 = downloadUrls.first;
                                                                                                });
                                                                                              } else {
                                                                                                safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                            }

                                                                                            if (_model.uploadedFileUrl4 != '') {
                                                                                              await AnexosLeadTable().insert({
                                                                                                'lead_id': leadLeadRow.id,
                                                                                                'tipo': 'contrato',
                                                                                                'url': _model.uploadedFileUrl4,
                                                                                              });
                                                                                              safeSetState(() => _model.requestCompleter1 = null);
                                                                                              await _model.waitForRequestCompleted1();
                                                                                            }
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.file_upload_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 32.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                        ].divide(SizedBox(width: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ].addToEnd(
                                                                      SizedBox(
                                                                          height:
                                                                              25.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  wrapWithModel(
                                                    model:
                                                        _model.pixTabDataModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: PixTabDataWidget(
                                                      leadId: leadLeadRow.id,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
