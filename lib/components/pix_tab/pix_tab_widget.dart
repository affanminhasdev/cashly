import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pix_tab_model.dart';
export 'pix_tab_model.dart';

class PixTabWidget extends StatefulWidget {
  const PixTabWidget({
    super.key,
    required this.callback,
    required this.selectedIndex,
  });

  final Future Function(int index)? callback;
  final int? selectedIndex;

  @override
  State<PixTabWidget> createState() => _PixTabWidgetState();
}

class _PixTabWidgetState extends State<PixTabWidget> {
  late PixTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PixTabModel());

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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.callback?.call(
                                0,
                              );
                            },
                            child: Text(
                              'TOTAL',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    color: widget.selectedIndex == 0
                                        ? FlutterFlowTheme.of(context).primary
                                        : Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 50.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.callback?.call(
                                1,
                              );
                            },
                            child: Text(
                              'PENDENTE HOJE',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    color: widget.selectedIndex == 1
                                        ? FlutterFlowTheme.of(context).primary
                                        : Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.callback?.call(
                              2,
                            );
                          },
                          child: Text(
                            'PAGO',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Ubuntu',
                                  color: widget.selectedIndex == 2
                                      ? FlutterFlowTheme.of(context).primary
                                      : Colors.black,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: 100.0,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 0
                                  ? FlutterFlowTheme.of(context).primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: 135.0,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 1
                                  ? FlutterFlowTheme.of(context).primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 0.0, 0.0),
                          child: Container(
                            width: 100.0,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: widget.selectedIndex == 2
                                  ? FlutterFlowTheme.of(context).primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
