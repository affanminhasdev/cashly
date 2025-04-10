import '/components/appbar/appbar_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Model for Menubar component.
  late MenubarModel menubarModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    menubarModel = createModel(context, () => MenubarModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    menubarModel.dispose();
  }
}
