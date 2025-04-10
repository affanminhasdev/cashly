import '/backend/supabase/supabase.dart';
import '/components/appbar/appbar_widget.dart';
import '/components/compo_pix/compo_pix_widget.dart';
import '/components/menubar/menubar_widget.dart';
import '/components/pix_tab/pix_tab_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aprovacao_widget.dart' show AprovacaoWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AprovacaoModel extends FlutterFlowModel<AprovacaoWidget> {
  ///  Local state fields for this page.
  /// This index shows the tab index
  int selectedIndex = 1;

  List<PlanoRow> planos = [];
  void addToPlanos(PlanoRow item) => planos.add(item);
  void removeFromPlanos(PlanoRow item) => planos.remove(item);
  void removeAtIndexFromPlanos(int index) => planos.removeAt(index);
  void insertAtIndexInPlanos(int index, PlanoRow item) =>
      planos.insert(index, item);
  void updatePlanosAtIndex(int index, Function(PlanoRow) updateFn) =>
      planos[index] = updateFn(planos[index]);

  ///  State fields for stateful widgets in this page.

  Completer<List<PixRow>>? requestCompleter;
  // Model for AppbarCop.
  late AppbarModel appbarCopModel;
  // Model for PixTab component.
  late PixTabModel pixTabModel;
  // Model for compoPix component.
  late CompoPixModel compoPixModel;
  // Model for Menubar component.
  late MenubarModel menubarModel;

  @override
  void initState(BuildContext context) {
    appbarCopModel = createModel(context, () => AppbarModel());
    pixTabModel = createModel(context, () => PixTabModel());
    compoPixModel = createModel(context, () => CompoPixModel());
    menubarModel = createModel(context, () => MenubarModel());
  }

  @override
  void dispose() {
    appbarCopModel.dispose();
    pixTabModel.dispose();
    compoPixModel.dispose();
    menubarModel.dispose();
  }

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
