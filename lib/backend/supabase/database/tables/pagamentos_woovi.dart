import '../database.dart';

class PagamentosWooviTable extends SupabaseTable<PagamentosWooviRow> {
  @override
  String get tableName => 'pagamentos_woovi';

  @override
  PagamentosWooviRow createRow(Map<String, dynamic> data) =>
      PagamentosWooviRow(data);
}

class PagamentosWooviRow extends SupabaseDataRow {
  PagamentosWooviRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentosWooviTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get dataPagamento => getField<DateTime>('data_pagamento');
  set dataPagamento(DateTime? value) =>
      setField<DateTime>('data_pagamento', value);

  String? get linkPagamento => getField<String>('link_pagamento');
  set linkPagamento(String? value) => setField<String>('link_pagamento', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get valor => getField<String>('valor');
  set valor(String? value) => setField<String>('valor', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  int? get multaId => getField<int>('multa_id');
  set multaId(int? value) => setField<int>('multa_id', value);

  String? get nomePagador => getField<String>('nome_pagador');
  set nomePagador(String? value) => setField<String>('nome_pagador', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  String? get correlationID => getField<String>('correlationID');
  set correlationID(String? value) => setField<String>('correlationID', value);

  String? get expiresDate => getField<String>('expires_date');
  set expiresDate(String? value) => setField<String>('expires_date', value);
}
