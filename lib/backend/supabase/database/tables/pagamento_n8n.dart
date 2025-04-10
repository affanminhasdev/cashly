import '../database.dart';

class PagamentoN8nTable extends SupabaseTable<PagamentoN8nRow> {
  @override
  String get tableName => 'pagamento_n8n';

  @override
  PagamentoN8nRow createRow(Map<String, dynamic> data) => PagamentoN8nRow(data);
}

class PagamentoN8nRow extends SupabaseDataRow {
  PagamentoN8nRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentoN8nTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double? get parcela => getField<double>('parcela');
  set parcela(double? value) => setField<double>('parcela', value);

  String? get linkPagamento => getField<String>('link_pagamento');
  set linkPagamento(String? value) => setField<String>('link_pagamento', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  int? get idPlano => getField<int>('id_plano');
  set idPlano(int? value) => setField<int>('id_plano', value);

  int? get idLead => getField<int>('id_lead');
  set idLead(int? value) => setField<int>('id_lead', value);

  DateTime? get dataPagamento => getField<DateTime>('data_pagamento');
  set dataPagamento(DateTime? value) =>
      setField<DateTime>('data_pagamento', value);

  bool? get gerarPix => getField<bool>('gerar_pix');
  set gerarPix(bool? value) => setField<bool>('gerar_pix', value);

  String? get documentNumber => getField<String>('document_number');
  set documentNumber(String? value) =>
      setField<String>('document_number', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get pixCopiaECola => getField<String>('pix_copia_e_cola');
  set pixCopiaECola(String? value) =>
      setField<String>('pix_copia_e_cola', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  DateTime? get dataDeVencimento => getField<DateTime>('data_de_vencimento');
  set dataDeVencimento(DateTime? value) =>
      setField<DateTime>('data_de_vencimento', value);

  bool? get posterga => getField<bool>('posterga');
  set posterga(bool? value) => setField<bool>('posterga', value);

  String? get hoje => getField<String>('hoje');
  set hoje(String? value) => setField<String>('hoje', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get nomeAbrevia => getField<String>('nome_abrevia');
  set nomeAbrevia(String? value) => setField<String>('nome_abrevia', value);

  String? get numeroParcelas => getField<String>('numero_parcelas');
  set numeroParcelas(String? value) =>
      setField<String>('numero_parcelas', value);

  bool? get pixEnviado => getField<bool>('pix_enviado');
  set pixEnviado(bool? value) => setField<bool>('pix_enviado', value);

  String? get alertaWhatsapp => getField<String>('alerta_whatsapp');
  set alertaWhatsapp(String? value) =>
      setField<String>('alerta_whatsapp', value);
}
