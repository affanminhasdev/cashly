import '/backend/supabase/supabase.dart';
import '/components/parcela_mobile_data_table_body_copy/parcela_mobile_data_table_body_copy_widget.dart';
import '/components/parcela_mobile_table_header/parcela_mobile_table_header_widget.dart';
import '/components/parcela_table_header/parcela_table_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'parcelas_widget.dart' show ParcelasWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ParcelasModel extends FlutterFlowModel<ParcelasWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Parcelas widget.
  List<PlanoRow>? planoRecord;
  // Stores action output result for [Backend Call - Query Rows] action in Parcelas widget.
  List<PagamentoRow>? pagamento;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for ParcelaTableHeader component.
  late ParcelaTableHeaderModel parcelaTableHeaderModel;
  // Model for ParcelaMobileTableHeader component.
  late ParcelaMobileTableHeaderModel parcelaMobileTableHeaderModel;
  // Model for ParcelaMobileDataTableBodyCopy component.
  late ParcelaMobileDataTableBodyCopyModel parcelaMobileDataTableBodyCopyModel;

  @override
  void initState(BuildContext context) {
    parcelaTableHeaderModel =
        createModel(context, () => ParcelaTableHeaderModel());
    parcelaMobileTableHeaderModel =
        createModel(context, () => ParcelaMobileTableHeaderModel());
    parcelaMobileDataTableBodyCopyModel =
        createModel(context, () => ParcelaMobileDataTableBodyCopyModel());
  }

  @override
  void dispose() {
    expandableExpandableController.dispose();
    parcelaTableHeaderModel.dispose();
    parcelaMobileTableHeaderModel.dispose();
    parcelaMobileDataTableBodyCopyModel.dispose();
  }
}
