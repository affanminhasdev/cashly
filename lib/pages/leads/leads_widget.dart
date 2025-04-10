import '/backend/supabase/supabase.dart';
import '/components/add_column_kanban/add_column_kanban_widget.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/columns_kanban/columns_kanban_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/components_effects/shimmer_kanban/shimmer_kanban_widget.dart';
import '/components_effects/shimmer_search/shimmer_search_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'leads_model.dart';
export 'leads_model.dart';

class LeadsWidget extends StatefulWidget {
  const LeadsWidget({super.key});

  static String routeName = 'Leads';
  static String routePath = '/leads';

  @override
  State<LeadsWidget> createState() => _LeadsWidgetState();
}

class _LeadsWidgetState extends State<LeadsWidget> {
  late LeadsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadsModel());

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
          visible: FFAppState().Usuario.role == 2,
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
                          child: AddColumnKanbanWidget(),
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
              wrapWithModel(
                model: _model.appbarModel,
                updateCallback: () => safeSetState(() {}),
                child: AppbarWidget(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.menubarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenubarWidget(
                          page: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            36.0, 0.0, 46.0, 0.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Vendedor',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Ubuntu',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      FutureBuilder<List<UsuariosRow>>(
                                        future: UsuariosTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'role',
                                            3,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return ShimmerSearchWidget();
                                          }
                                          List<UsuariosRow>
                                              dropDownUsuariosRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??= 'Todos',
                                            ),
                                            options: functions.sellerList(
                                                dropDownUsuariosRowList
                                                    .map((e) => e.nome)
                                                    .withoutNulls
                                                    .toList()),
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 200.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Ubuntu',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Selecione',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                              StreamBuilder<List<KanbanRow>>(
                                stream: _model.rowSupabaseStream ??= SupaFlow
                                    .client
                                    .from("kanban")
                                    .stream(primaryKey: ['id']).map((list) =>
                                        list
                                            .map((item) => KanbanRow(item))
                                            .toList()),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return ShimmerKanbanWidget();
                                  }
                                  List<KanbanRow> rowKanbanRowList =
                                      snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        rowKanbanRowList.length, (rowIndex) {
                                      final rowKanbanRow =
                                          rowKanbanRowList[rowIndex];
                                      return Builder(
                                        builder: (context) =>
                                            StreamBuilder<List<LeadRow>>(
                                          stream: _model
                                                  .containerSupabaseStream ??=
                                              SupaFlow.client
                                                  .from("lead")
                                                  .stream(primaryKey: ['id'])
                                                  .order('updated_at')
                                                  .map((list) => list
                                                      .map((item) =>
                                                          LeadRow(item))
                                                      .toList()),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return ShimmerKanbanWidget();
                                            }
                                            List<LeadRow>
                                                columnsKanbanLeadRowList =
                                                snapshot.data!;

                                            return ColumnsKanbanWidget(
                                              key: Key(
                                                  'Keycnz_${rowIndex}_of_${rowKanbanRowList.length}'),
                                              coluna: rowKanbanRow.coluna!,
                                              dados: columnsKanbanLeadRowList
                                                  .where((e) =>
                                                      e.etapa ==
                                                      rowKanbanRow.coluna)
                                                  .toList(),
                                              vendedor: _model.dropDownValue!,
                                              callback: () async {},
                                            );
                                          },
                                        ),
                                      );
                                    }).divide(SizedBox(width: 36.0)),
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 10.0)),
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
      ),
    );
  }
}
