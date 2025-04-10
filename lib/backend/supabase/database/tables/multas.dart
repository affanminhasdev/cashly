import '../database.dart';

class MultasTable extends SupabaseTable<MultasRow> {
  @override
  String get tableName => 'multas';

  @override
  MultasRow createRow(Map<String, dynamic> data) => MultasRow(data);
}

class MultasRow extends SupabaseDataRow {
  MultasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MultasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get descricaoDaInfracao => getField<String>('descricao_da_infracao');
  set descricaoDaInfracao(String? value) =>
      setField<String>('descricao_da_infracao', value);

  String? get placaCarro => getField<String>('placa_carro');
  set placaCarro(String? value) => setField<String>('placa_carro', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get dataInfracao => getField<String>('data_infracao');
  set dataInfracao(String? value) => setField<String>('data_infracao', value);

  String? get numeroInfracao => getField<String>('numero_infracao');
  set numeroInfracao(String? value) =>
      setField<String>('numero_infracao', value);

  String? get codigoDaInfracao => getField<String>('codigo_da_infracao');
  set codigoDaInfracao(String? value) =>
      setField<String>('codigo_da_infracao', value);

  double? get numeroRenaif => getField<double>('numero_renaif');
  set numeroRenaif(double? value) => setField<double>('numero_renaif', value);

  String? get valor => getField<String>('valor');
  set valor(String? value) => setField<String>('valor', value);

  String? get dataLimiteIdentificacao =>
      getField<String>('data_limite_identificacao');
  set dataLimiteIdentificacao(String? value) =>
      setField<String>('data_limite_identificacao', value);

  String? get dataPenalidade => getField<String>('data_penalidade');
  set dataPenalidade(String? value) =>
      setField<String>('data_penalidade', value);

  String? get dataVencimentoDoDesconto =>
      getField<String>('data_vencimento_do_desconto');
  set dataVencimentoDoDesconto(String? value) =>
      setField<String>('data_vencimento_do_desconto', value);

  String? get tipo => getField<String>('tipo');
  set tipo(String? value) => setField<String>('tipo', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get dataDoRegistroDePagamento =>
      getField<String>('data_do_registro_de_Pagamento');
  set dataDoRegistroDePagamento(String? value) =>
      setField<String>('data_do_registro_de_Pagamento', value);

  String? get pdf => getField<String>('pdf');
  set pdf(String? value) => setField<String>('pdf', value);

  bool get processed => getField<bool>('processed')!;
  set processed(bool value) => setField<bool>('processed', value);

  String? get empresa => getField<String>('empresa');
  set empresa(String? value) => setField<String>('empresa', value);

  String? get pagoCheck => getField<String>('pago_check');
  set pagoCheck(String? value) => setField<String>('pago_check', value);

  String? get pixEnviado => getField<String>('pix_enviado');
  set pixEnviado(String? value) => setField<String>('pix_enviado', value);

  int? get veiculoId => getField<int>('veiculo_id');
  set veiculoId(int? value) => setField<int>('veiculo_id', value);

  String? get pagoCashly => getField<String>('pago_cashly');
  set pagoCashly(String? value) => setField<String>('pago_cashly', value);

  String? get pagoGov => getField<String>('pago_gov');
  set pagoGov(String? value) => setField<String>('pago_gov', value);

  String? get dataInclucao => getField<String>('data_inclucao');
  set dataInclucao(String? value) => setField<String>('data_inclucao', value);

  int? get mesInfracao => getField<int>('mes_infracao');
  set mesInfracao(int? value) => setField<int>('mes_infracao', value);

  String? get formularioIndicacao => getField<String>('formulario_indicacao');
  set formularioIndicacao(String? value) =>
      setField<String>('formulario_indicacao', value);

  String? get boletos => getField<String>('boletos');
  set boletos(String? value) => setField<String>('boletos', value);

  String? get boletoStatus => getField<String>('boleto_status');
  set boletoStatus(String? value) => setField<String>('boleto_status', value);

  int? get anoInfracao => getField<int>('ano_infracao');
  set anoInfracao(int? value) => setField<int>('ano_infracao', value);

  DateTime? get dataInclucaoTs => getField<DateTime>('data_inclucao_ts');
  set dataInclucaoTs(DateTime? value) =>
      setField<DateTime>('data_inclucao_ts', value);

  String? get valorPagoGov => getField<String>('valor_pago_gov');
  set valorPagoGov(String? value) => setField<String>('valor_pago_gov', value);
}
