import '../database.dart';

class PagamentoN8nMsgSucessoTable
    extends SupabaseTable<PagamentoN8nMsgSucessoRow> {
  @override
  String get tableName => 'pagamento_n8n_msg_sucesso';

  @override
  PagamentoN8nMsgSucessoRow createRow(Map<String, dynamic> data) =>
      PagamentoN8nMsgSucessoRow(data);
}

class PagamentoN8nMsgSucessoRow extends SupabaseDataRow {
  PagamentoN8nMsgSucessoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PagamentoN8nMsgSucessoTable();

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

  int? get alerta => getField<int>('alerta');
  set alerta(int? value) => setField<int>('alerta', value);

  String? get alertaWhatsapp => getField<String>('alerta_whatsapp');
  set alertaWhatsapp(String? value) =>
      setField<String>('alerta_whatsapp', value);

  String? get telefone2 => getField<String>('Telefone2');
  set telefone2(String? value) => setField<String>('Telefone2', value);

  String? get token => getField<String>('Token');
  set token(String? value) => setField<String>('Token', value);

  String? get vencidoElegivel => getField<String>('vencido_elegivel');
  set vencidoElegivel(String? value) =>
      setField<String>('vencido_elegivel', value);

  String? get linkPosterga => getField<String>('link_posterga');
  set linkPosterga(String? value) => setField<String>('link_posterga', value);

  bool? get proibidoAdiar => getField<bool>('Proibido Adiar');
  set proibidoAdiar(bool? value) => setField<bool>('Proibido Adiar', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get sMSSucesso => getField<bool>('SMS_sucesso');
  set sMSSucesso(bool? value) => setField<bool>('SMS_sucesso', value);

  int? get reativarPlano => getField<int>('reativar_plano');
  set reativarPlano(int? value) => setField<int>('reativar_plano', value);

  int? get postergaPlano => getField<int>('posterga_plano');
  set postergaPlano(int? value) => setField<int>('posterga_plano', value);

  bool? get botaoProrrogado => getField<bool>('botao_prorrogado');
  set botaoProrrogado(bool? value) => setField<bool>('botao_prorrogado', value);

  bool? get botaoReativar => getField<bool>('botao_reativar');
  set botaoReativar(bool? value) => setField<bool>('botao_reativar', value);

  bool? get botaoPagar => getField<bool>('botao_pagar');
  set botaoPagar(bool? value) => setField<bool>('botao_pagar', value);

  int? get vencidas => getField<int>('vencidas');
  set vencidas(int? value) => setField<int>('vencidas', value);

  int? get pagas => getField<int>('pagas');
  set pagas(int? value) => setField<int>('pagas', value);

  int? get prorrogadas => getField<int>('prorrogadas');
  set prorrogadas(int? value) => setField<int>('prorrogadas', value);

  int? get emAberto => getField<int>('Em Aberto');
  set emAberto(int? value) => setField<int>('Em Aberto', value);

  bool? get vencidoEnviado => getField<bool>('vencido_enviado');
  set vencidoEnviado(bool? value) => setField<bool>('vencido_enviado', value);
}
