import '/backend/supabase/supabase.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/compo_pix/compo_pix_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/components/pix_tab/pix_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'aprovacao_model.dart';
export 'aprovacao_model.dart';

class AprovacaoWidget extends StatefulWidget {
  const AprovacaoWidget({super.key});

  static String routeName = 'Aprovacao';
  static String routePath = '/aprovacao';

  @override
  State<AprovacaoWidget> createState() => _AprovacaoWidgetState();
}

class _AprovacaoWidgetState extends State<AprovacaoWidget> {
  late AprovacaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AprovacaoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribe(
        'pix',
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await actions.subscribe(
        'pix',
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixRow>>(
      future: (_model.requestCompleter ??= Completer<List<PixRow>>()
            ..complete(PixTable().queryRows(
              queryFn: (q) => q.order('created_at'),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PixRow> aprovacaoPixRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.appbarCopModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: AppbarWidget(),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -0.56),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    85.0, 0.0, 3.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.pixTabModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PixTabWidget(
                                    selectedIndex: _model.selectedIndex,
                                    callback: (index) async {
                                      _model.selectedIndex = index;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            if (() {
                              if (_model.selectedIndex == 0) {
                                return aprovacaoPixRowList;
                              } else if (_model.selectedIndex == 1) {
                                return aprovacaoPixRowList
                                    .where((e) =>
                                        (dateTimeFormat(
                                              "yMd",
                                              e.createdAt,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) ==
                                            dateTimeFormat(
                                              "yMd",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )) &&
                                        (e.status != 'Pago'))
                                    .toList();
                              } else {
                                return aprovacaoPixRowList
                                    .where((e) => e.status == 'Pago')
                                    .toList();
                              }
                            }()
                                .isNotEmpty)
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.73),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      105.0, 10.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.compoPixModel,
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: CompoPixWidget(
                                      aprovar: () {
                                        if (_model.selectedIndex == 0) {
                                          return aprovacaoPixRowList;
                                        } else if (_model.selectedIndex == 1) {
                                          return aprovacaoPixRowList
                                              .where((e) =>
                                                  (dateTimeFormat(
                                                        "yMd",
                                                        e.createdAt,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ) ==
                                                      dateTimeFormat(
                                                        "yMd",
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )) &&
                                                  (e.status != 'Pago'))
                                              .toList();
                                        } else {
                                          return aprovacaoPixRowList
                                              .where((e) => e.status == 'Pago')
                                              .toList();
                                        }
                                      }(),
                                      callback: () async {
                                        safeSetState(() =>
                                            _model.requestCompleter = null);
                                        await _model.waitForRequestCompleted();

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            if (!(() {
                              if (_model.selectedIndex == 0) {
                                return aprovacaoPixRowList;
                              } else if (_model.selectedIndex == 1) {
                                return aprovacaoPixRowList
                                    .where((e) =>
                                        (dateTimeFormat(
                                              "yMd",
                                              e.createdAt,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ) ==
                                            dateTimeFormat(
                                              "yMd",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )) &&
                                        (e.status != 'Pago'))
                                    .toList();
                              } else {
                                return aprovacaoPixRowList
                                    .where((e) => e.status == 'Pago')
                                    .toList();
                              }
                            }()
                                .isNotEmpty))
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'No Data Available',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Ubuntu',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.menubarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MenubarWidget(
                            page: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
