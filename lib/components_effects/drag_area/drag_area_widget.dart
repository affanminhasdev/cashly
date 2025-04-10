import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drag_area_model.dart';
export 'drag_area_model.dart';

class DragAreaWidget extends StatefulWidget {
  const DragAreaWidget({super.key});

  @override
  State<DragAreaWidget> createState() => _DragAreaWidgetState();
}

class _DragAreaWidgetState extends State<DragAreaWidget> {
  late DragAreaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DragAreaModel());

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
      width: 200.0,
      height: 100.0,
      decoration: BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/drag.png',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
