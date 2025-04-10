import '/backend/supabase/supabase.dart';
import '/components/pix_component/pix_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'pix_tab_data_model.dart';
export 'pix_tab_data_model.dart';

class PixTabDataWidget extends StatefulWidget {
  const PixTabDataWidget({
    super.key,
    required this.leadId,
  });

  final int? leadId;

  @override
  State<PixTabDataWidget> createState() => _PixTabDataWidgetState();
}

class _PixTabDataWidgetState extends State<PixTabDataWidget> {
  late PixTabDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PixTabDataModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.pixQueryResult = await PixTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'lead_id',
          widget.leadId,
        ),
      );
      _model.isLoading = false;
      safeSetState(() {});
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if ((_model.pixQueryResult != null &&
                    (_model.pixQueryResult)!.isNotEmpty) &&
                !_model.isLoading)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.pixComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: PixComponentWidget(
                    aprovar: _model.pixQueryResult,
                    callback: () async {},
                  ),
                ),
              ),
            if (!(_model.pixQueryResult != null &&
                    (_model.pixQueryResult)!.isNotEmpty) &&
                !_model.isLoading)
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'No Data Available',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Ubuntu',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            if (_model.isLoading)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 50.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.CustomLoader(
                    width: 50.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    size: 40.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
