import '../database.dart';

class PagamentoTable extends SupabaseTable<PagamentoRow> {
  @override
  String get tableName => 'pagamento';

  @override
  PagamentoRow createRow(Map<String, dynamic> data) => PagamentoRow(data);
}

class PagamentoRow extends SupabaseDataRow {
  PagamentoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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

  bool get gerarPix => getField<bool>('gerar_pix')!;
  set gerarPix(bool value) => setField<bool>('gerar_pix', value);

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

  bool get postergado => getField<bool>('postergado')!;
  set postergado(bool value) => setField<bool>('postergado', value);

  String? get hoje => getField<String>('hoje');
  set hoje(String? value) => setField<String>('hoje', value);

  bool? get pixEnviado => getField<bool>('pix_enviado');
  set pixEnviado(bool? value) => setField<bool>('pix_enviado', value);

  bool? get postergaCliente => getField<bool>('posterga_cliente');
  set postergaCliente(bool? value) => setField<bool>('posterga_cliente', value);

  int? get postergaPlano => getField<int>('posterga_plano');
  set postergaPlano(int? value) => setField<int>('posterga_plano', value);

  int? get alerta => getField<int>('alerta');
  set alerta(int? value) => setField<int>('alerta', value);

  String? get alertaWhatsapp => getField<String>('alerta_whatsapp');
  set alertaWhatsapp(String? value) =>
      setField<String>('alerta_whatsapp', value);

  String? get identi => getField<String>('identi');
  set identi(String? value) => setField<String>('identi', value);

  String? get qrCodeImageWoovi => getField<String>('qrCodeImageWoovi');
  set qrCodeImageWoovi(String? value) =>
      setField<String>('qrCodeImageWoovi', value);

  bool? get temCashback => getField<bool>('tem_cashback');
  set temCashback(bool? value) => setField<bool>('tem_cashback', value);

  String? get maskedCpf => getField<String>('maskedCpf');
  set maskedCpf(String? value) => setField<String>('maskedCpf', value);

  String? get cashback => getField<String>('cashback');
  set cashback(String? value) => setField<String>('cashback', value);

  bool? get field24Horas => getField<bool>('24_horas');
  set field24Horas(bool? value) => setField<bool>('24_horas', value);

  int? get reativarPlano => getField<int>('reativar_plano');
  set reativarPlano(int? value) => setField<int>('reativar_plano', value);

  bool? get gerarPixAvulso => getField<bool>('gerar_pix_avulso');
  set gerarPixAvulso(bool? value) => setField<bool>('gerar_pix_avulso', value);

  double? get custo => getField<double>('custo');
  set custo(double? value) => setField<double>('custo', value);

  double? get lucro => getField<double>('lucro');
  set lucro(double? value) => setField<double>('lucro', value);

  String? get vencidoElegivel => getField<String>('vencido_elegivel');
  set vencidoElegivel(String? value) =>
      setField<String>('vencido_elegivel', value);

  bool? get vencidoEnviado => getField<bool>('vencido_enviado');
  set vencidoEnviado(bool? value) => setField<bool>('vencido_enviado', value);

  bool? get sMSSucesso => getField<bool>('SMS_sucesso');
  set sMSSucesso(bool? value) => setField<bool>('SMS_sucesso', value);
}
