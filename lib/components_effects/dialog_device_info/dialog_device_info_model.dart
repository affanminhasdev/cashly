import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dialog_device_info_widget.dart' show DialogDeviceInfoWidget;
import 'package:flutter/material.dart';

class DialogDeviceInfoModel extends FlutterFlowModel<DialogDeviceInfoWidget> {
  ///  Local state fields for this component.

  bool? bloqueado = false;

  String? lockStatus;

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  Completer<List<DeviceRow>>? requestCompleter;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
