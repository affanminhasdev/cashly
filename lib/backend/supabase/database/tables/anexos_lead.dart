import '../database.dart';

class AnexosLeadTable extends SupabaseTable<AnexosLeadRow> {
  @override
  String get tableName => 'anexos_lead';

  @override
  AnexosLeadRow createRow(Map<String, dynamic> data) => AnexosLeadRow(data);
}

class AnexosLeadRow extends SupabaseDataRow {
  AnexosLeadRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnexosLeadTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get leadId => getField<int>('lead_id');
  set leadId(int? value) => setField<int>('lead_id', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
