import '../database.dart';

class CcbTable extends SupabaseTable<CcbRow> {
  @override
  String get tableName => 'ccb';

  @override
  CcbRow createRow(Map<String, dynamic> data) => CcbRow(data);
}

class CcbRow extends SupabaseDataRow {
  CcbRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CcbTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get customServiceNumber => getField<String>('custom_service_number');
  set customServiceNumber(String? value) =>
      setField<String>('custom_service_number', value);

  String? get contrato => getField<String>('contrato');
  set contrato(String? value) => setField<String>('contrato', value);

  String? get statusCcb => getField<String>('status_ccb');
  set statusCcb(String? value) => setField<String>('status_ccb', value);

  String? get idCcb => getField<String>('id_ccb');
  set idCcb(String? value) => setField<String>('id_ccb', value);

  int? get idPlanoCcb => getField<int>('id_plano_ccb');
  set idPlanoCcb(int? value) => setField<int>('id_plano_ccb', value);

  int? get idLeadCcb => getField<int>('id_lead_ccb');
  set idLeadCcb(int? value) => setField<int>('id_lead_ccb', value);

  String? get idDeviceCcb => getField<String>('id_device_ccb');
  set idDeviceCcb(String? value) => setField<String>('id_device_ccb', value);

  String? get assinarCcb => getField<String>('assinar_ccb');
  set assinarCcb(String? value) => setField<String>('assinar_ccb', value);

  bool? get temCcb => getField<bool>('tem_ccb');
  set temCcb(bool? value) => setField<bool>('tem_ccb', value);

  int? get chavePixCcb => getField<int>('chave_pix_ccb');
  set chavePixCcb(int? value) => setField<int>('chave_pix_ccb', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get statusCrm => getField<String>('status_crm');
  set statusCrm(String? value) => setField<String>('status_crm', value);
}
