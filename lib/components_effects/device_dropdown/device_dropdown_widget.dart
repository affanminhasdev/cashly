import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'device_dropdown_model.dart';
export 'device_dropdown_model.dart';

class DeviceDropdownWidget extends StatefulWidget {
  const DeviceDropdownWidget({
    super.key,
    required this.planId,
    this.deviceId,
    required this.deviceList,
    required this.allDevices,
  });

  final int? planId;
  final String? deviceId;
  final List<String>? deviceList;
  final List<DeviceRow>? allDevices;

  @override
  State<DeviceDropdownWidget> createState() => _DeviceDropdownWidgetState();
}

class _DeviceDropdownWidgetState extends State<DeviceDropdownWidget> {
  late DeviceDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      multiSelectController: _model.dropDownValueController ??=
          FormListFieldController<String>(
              _model.dropDownValue ??= List<String>.from(
        widget.deviceList ?? [],
      )),
      options: functions.filterDevicesAtTop(
          widget.allDevices!.map((e) => e.deviceId).toList(),
          widget.deviceList!.toList()),
      width: 100.0,
      height: 40.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Inter',
            letterSpacing: 0.0,
          ),
      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Ubuntu',
            letterSpacing: 0.0,
          ),
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Ubuntu',
            letterSpacing: 0.0,
          ),
      hintText: 'Abrir Lista',
      searchHintText: 'Device',
      icon: FaIcon(
        FontAwesomeIcons.solidCaretSquareDown,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: true,
      isMultiSelect: true,
      onMultiSelectChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val); // onDropdownSelected
        await PlanoTable().update(
          data: {
            'device_list': _model.dropDownValue,
          },
          matchingRows: (rows) => rows.eqOrNull(
            'id_pedido',
            widget.planId,
          ),
        );
      },
    );
  }
}
