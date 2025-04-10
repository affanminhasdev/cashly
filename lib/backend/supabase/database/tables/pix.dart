import '../database.dart';

class PixTable extends SupabaseTable<PixRow> {
  @override
  String get tableName => 'pix';

  @override
  PixRow createRow(Map<String, dynamic> data) => PixRow(data);
}

class PixRow extends SupabaseDataRow {
  PixRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PixTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String? get chavePix => getField<String>('chave_pix');
  set chavePix(String? value) => setField<String>('chave_pix', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime get dataDePagamento => getField<DateTime>('data_de_pagamento')!;
  set dataDePagamento(DateTime value) =>
      setField<DateTime>('data_de_pagamento', value);

  String? get pagamentoLinkUrl => getField<String>('pagamento_link_url');
  set pagamentoLinkUrl(String? value) =>
      setField<String>('pagamento_link_url', value);

  int get leadId => getField<int>('lead_id')!;
  set leadId(int value) => setField<int>('lead_id', value);

  int get planoId => getField<int>('plano_id')!;
  set planoId(int value) => setField<int>('plano_id', value);

  String? get documentNumber => getField<String>('document_number');
  set documentNumber(String? value) =>
      setField<String>('document_number', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get correlationID => getField<String>('correlationID');
  set correlationID(String? value) => setField<String>('correlationID', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get banco => getField<String>('banco');
  set banco(String? value) => setField<String>('banco', value);

  double? get branch => getField<double>('branch');
  set branch(double? value) => setField<double>('branch', value);

  double? get account => getField<double>('account');
  set account(double? value) => setField<double>('account', value);

  String? get logsStatusErro => getField<String>('logs_status_erro');
  set logsStatusErro(String? value) =>
      setField<String>('logs_status_erro', value);
}
