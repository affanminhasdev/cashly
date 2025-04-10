import '../database.dart';

class PlanosLockedTable extends SupabaseTable<PlanosLockedRow> {
  @override
  String get tableName => 'planos_locked';

  @override
  PlanosLockedRow createRow(Map<String, dynamic> data) => PlanosLockedRow(data);
}

class PlanosLockedRow extends SupabaseDataRow {
  PlanosLockedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlanosLockedTable();

  int? get idPedido => getField<int>('id_pedido');
  set idPedido(int? value) => setField<int>('id_pedido', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  double? get valorPix => getField<double>('valor_pix');
  set valorPix(double? value) => setField<double>('valor_pix', value);

  double? get resgate => getField<double>('resgate');
  set resgate(double? value) => setField<double>('resgate', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  double? get valorCelular => getField<double>('valor_celular');
  set valorCelular(double? value) => setField<double>('valor_celular', value);

  DateTime? get dataPix => getField<DateTime>('data_pix');
  set dataPix(DateTime? value) => setField<DateTime>('data_pix', value);

  bool? get aprovarPix => getField<bool>('aprovar_pix');
  set aprovarPix(bool? value) => setField<bool>('aprovar_pix', value);

  String? get numeroParcelas => getField<String>('numero_parcelas');
  set numeroParcelas(String? value) =>
      setField<String>('numero_parcelas', value);

  String? get parcelaLimpa => getField<String>('parcela_limpa');
  set parcelaLimpa(String? value) => setField<String>('parcela_limpa', value);

  String? get comecouAPagar => getField<String>('começou_a_pagar');
  set comecouAPagar(String? value) =>
      setField<String>('começou_a_pagar', value);

  DateTime? get dia => getField<DateTime>('dia');
  set dia(DateTime? value) => setField<DateTime>('dia', value);

  String? get statusDeEnvio => getField<String>('status_de_envio');
  set statusDeEnvio(String? value) =>
      setField<String>('status_de_envio', value);

  String? get parcelaAtual => getField<String>('parcela_atual');
  set parcelaAtual(String? value) => setField<String>('parcela_atual', value);

  DateTime? get dateUpdatePix => getField<DateTime>('date_update_pix');
  set dateUpdatePix(DateTime? value) =>
      setField<DateTime>('date_update_pix', value);

  int? get leadId => getField<int>('lead_id');
  set leadId(int? value) => setField<int>('lead_id', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  double? get juros => getField<double>('juros');
  set juros(double? value) => setField<double>('juros', value);

  DateTime? get primeiroPagamento => getField<DateTime>('primeiro_pagamento');
  set primeiroPagamento(DateTime? value) =>
      setField<DateTime>('primeiro_pagamento', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  double? get parcela => getField<double>('parcela');
  set parcela(double? value) => setField<double>('parcela', value);

  String? get vendedorId => getField<String>('vendedor_id');
  set vendedorId(String? value) => setField<String>('vendedor_id', value);

  String? get deviceId => getField<String>('device_id');
  set deviceId(String? value) => setField<String>('device_id', value);

  List<String> get deviceList => getListField<String>('device_list');
  set deviceList(List<String>? value) =>
      setListField<String>('device_list', value);

  String? get token => getField<String>('Token');
  set token(String? value) => setField<String>('Token', value);

  int? get aprovarEmprestimo => getField<int>('aprovar_emprestimo');
  set aprovarEmprestimo(int? value) =>
      setField<int>('aprovar_emprestimo', value);

  String? get documentNumber => getField<String>('document_number');
  set documentNumber(String? value) =>
      setField<String>('document_number', value);

  String? get pagamentoLinkUrl => getField<String>('pagamento_link_url');
  set pagamentoLinkUrl(String? value) =>
      setField<String>('pagamento_link_url', value);

  List<String> get dadosFitbank => getListField<String>('dados_fitbank');
  set dadosFitbank(List<String>? value) =>
      setListField<String>('dados_fitbank', value);

  double? get searchProtocol => getField<double>('search_protocol');
  set searchProtocol(double? value) =>
      setField<double>('search_protocol', value);

  bool? get temCashback => getField<bool>('tem_cashback');
  set temCashback(bool? value) => setField<bool>('tem_cashback', value);

  String? get statusEmprestimo => getField<String>('status_emprestimo');
  set statusEmprestimo(String? value) =>
      setField<String>('status_emprestimo', value);

  String? get tipoDevice => getField<String>('tipo_device');
  set tipoDevice(String? value) => setField<String>('tipo_device', value);

  bool? get emitirCcb => getField<bool>('emitir_ccb');
  set emitirCcb(bool? value) => setField<bool>('emitir_ccb', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  double? get jurosDia => getField<double>('juros_dia');
  set jurosDia(double? value) => setField<double>('juros_dia', value);

  bool? get enviarContrato => getField<bool>('enviar_contrato');
  set enviarContrato(bool? value) => setField<bool>('enviar_contrato', value);

  String? get statusContrato => getField<String>('status_contrato');
  set statusContrato(String? value) =>
      setField<String>('status_contrato', value);

  String? get lockStatus => getField<String>('lock_status');
  set lockStatus(String? value) => setField<String>('lock_status', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);
}
