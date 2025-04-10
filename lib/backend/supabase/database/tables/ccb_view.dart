import '../database.dart';

class CcbViewTable extends SupabaseTable<CcbViewRow> {
  @override
  String get tableName => 'ccb_view';

  @override
  CcbViewRow createRow(Map<String, dynamic> data) => CcbViewRow(data);
}

class CcbViewRow extends SupabaseDataRow {
  CcbViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CcbViewTable();

  String? get idCcb => getField<String>('id_ccb');
  set idCcb(String? value) => setField<String>('id_ccb', value);

  int? get idLead => getField<int>('id_lead');
  set idLead(int? value) => setField<int>('id_lead', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get complemento => getField<String>('complemento');
  set complemento(String? value) => setField<String>('complemento', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get cep => getField<String>('cep');
  set cep(String? value) => setField<String>('cep', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get idPlano => getField<int>('id_plano');
  set idPlano(int? value) => setField<int>('id_plano', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  double? get jurosDia => getField<double>('juros_dia');
  set jurosDia(double? value) => setField<double>('juros_dia', value);

  String? get numeroParcelas => getField<String>('numero_parcelas');
  set numeroParcelas(String? value) =>
      setField<String>('numero_parcelas', value);

  DateTime? get primeiroPagamento => getField<DateTime>('primeiro_pagamento');
  set primeiroPagamento(DateTime? value) =>
      setField<DateTime>('primeiro_pagamento', value);

  String? get imei => getField<String>('imei');
  set imei(String? value) => setField<String>('imei', value);

  String? get fabricante => getField<String>('fabricante');
  set fabricante(String? value) => setField<String>('fabricante', value);

  String? get modelo => getField<String>('modelo');
  set modelo(String? value) => setField<String>('modelo', value);

  String? get dataNascimento => getField<String>('data_nascimento');
  set dataNascimento(String? value) =>
      setField<String>('data_nascimento', value);

  String? get numeroCnh => getField<String>('numero_cnh');
  set numeroCnh(String? value) => setField<String>('numero_cnh', value);

  String? get chavePix => getField<String>('chave_pix');
  set chavePix(String? value) => setField<String>('chave_pix', value);

  String? get uf => getField<String>('uf');
  set uf(String? value) => setField<String>('uf', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get banco => getField<String>('banco');
  set banco(String? value) => setField<String>('banco', value);

  String? get conta => getField<String>('conta');
  set conta(String? value) => setField<String>('conta', value);

  String? get agencia => getField<String>('agencia');
  set agencia(String? value) => setField<String>('agencia', value);
}
