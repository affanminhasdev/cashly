import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'postergar_mobile_dropdown_model.dart';
export 'postergar_mobile_dropdown_model.dart';

class PostergarMobileDropdownWidget extends StatefulWidget {
  const PostergarMobileDropdownWidget({
    super.key,
    required this.pagamentoId,
    this.selectedPostergar,
    required this.onSelectedValue,
  });

  final int? pagamentoId;
  final int? selectedPostergar;
  final Future Function(String value)? onSelectedValue;

  @override
  State<PostergarMobileDropdownWidget> createState() =>
      _PostergarMobileDropdownWidgetState();
}

class _PostergarMobileDropdownWidgetState
    extends State<PostergarMobileDropdownWidget> {
  late PostergarMobileDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostergarMobileDropdownModel());

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
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= functions.getPostergarByNumber(
            FFAppConstants.postergars.toList(), widget.selectedPostergar),
      ),
      options: FFAppConstants.postergars,
      onChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val); // onDropdownSelected
        await PagamentoTable().update(
          data: {
            'posterga_plano': functions.getNumberFromPostergar(
                FFAppConstants.postergars.toList(), _model.dropDownValue!),
          },
          matchingRows: (rows) => rows.eqOrNull(
            'id',
            widget.pagamentoId,
          ),
        );
        await widget.onSelectedValue?.call(
          _model.dropDownValue!,
        );
      },
      width: 70.0,
      height: 30.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Ubuntu',
            fontSize: 9.0,
            letterSpacing: 0.0,
          ),
      hintText: 'Abrir Lista',
      icon: FaIcon(
        FontAwesomeIcons.solidCaretSquareDown,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 15.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
