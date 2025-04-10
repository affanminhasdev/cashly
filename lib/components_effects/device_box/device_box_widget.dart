import '/backend/supabase/supabase.dart';
import '/components_effects/dialog_device_info/dialog_device_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'device_box_model.dart';
export 'device_box_model.dart';

class DeviceBoxWidget extends StatefulWidget {
  const DeviceBoxWidget({
    super.key,
    required this.deviceId,
    this.onRefresh,
  });

  final String? deviceId;
  final Future Function()? onRefresh;

  @override
  State<DeviceBoxWidget> createState() => _DeviceBoxWidgetState();
}

class _DeviceBoxWidgetState extends State<DeviceBoxWidget> {
  late DeviceBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceBoxModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.subscribe(
        'device',
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
    return Builder(
      builder: (context) => Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: FutureBuilder<List<DeviceRow>>(
          future: (_model.requestCompleter ??= Completer<List<DeviceRow>>()
                ..complete(DeviceTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'device_id',
                    widget.deviceId,
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
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<DeviceRow> deviceBoxDeviceRowList = snapshot.data!;

            final deviceBoxDeviceRow = deviceBoxDeviceRowList.isNotEmpty
                ? deviceBoxDeviceRowList.first
                : null;

            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
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
                          height: 535.0,
                          width: 400.0,
                          child: DialogDeviceInfoWidget(
                            deviceId: widget.deviceId!,
                            callback: () async {
                              safeSetState(
                                  () => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            deviceBoxDeviceRow?.deviceId,
                            'N/A',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      if (deviceBoxDeviceRow?.lockStatus == 'locked')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FaIcon(
                            FontAwesomeIcons.lock,
                            color: FlutterFlowTheme.of(context).error,
                            size: 12.0,
                          ),
                        ),
                      if (deviceBoxDeviceRow?.lockStatus == 'unlocked')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FaIcon(
                            FontAwesomeIcons.lockOpen,
                            color: FlutterFlowTheme.of(context).success,
                            size: 12.0,
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                        child: Text(
                          'STATUS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Ubuntu',
                                    color: Color(0xFFA2A0A0),
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: valueOrDefault<String>(
                          deviceBoxDeviceRow?.status,
                          'Ativo',
                        ),
                        options: FFButtonOptions(
                          height: 13.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 2.0, 6.0, 2.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: deviceBoxDeviceRow?.status == 'Ativo'
                              ? Color(0xFF0CA93F)
                              : FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
