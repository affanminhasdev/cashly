import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drop_area_model.dart';
export 'drop_area_model.dart';

class DropAreaWidget extends StatefulWidget {
  const DropAreaWidget({super.key});

  @override
  State<DropAreaWidget> createState() => _DropAreaWidgetState();
}

class _DropAreaWidgetState extends State<DropAreaWidget> {
  late DropAreaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropAreaModel());

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
          'assets/images/drop.png',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
