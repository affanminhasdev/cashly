import '../database.dart';

class LeadTable extends SupabaseTable<LeadRow> {
  @override
  String get tableName => 'lead';

  @override
  LeadRow createRow(Map<String, dynamic> data) => LeadRow(data);
}

class LeadRow extends SupabaseDataRow {
  LeadRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeadTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get cep => getField<String>('cep');
  set cep(String? value) => setField<String>('cep', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get uf => getField<String>('uf');
  set uf(String? value) => setField<String>('uf', value);

  String? get complemento => getField<String>('complemento');
  set complemento(String? value) => setField<String>('complemento', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);

  bool get airtable => getField<bool>('airtable')!;
  set airtable(bool value) => setField<bool>('airtable', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get etapa => getField<String>('etapa');
  set etapa(String? value) => setField<String>('etapa', value);

  String? get responsavel => getField<String>('responsavel');
  set responsavel(String? value) => setField<String>('responsavel', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get chavePix => getField<String>('chave_pix');
  set chavePix(String? value) => setField<String>('chave_pix', value);

  String? get linkIndicacao => getField<String>('link_indicacao');
  set linkIndicacao(String? value) => setField<String>('link_indicacao', value);

  String? get cor => getField<String>('cor');
  set cor(String? value) => setField<String>('cor', value);

  String? get telefone2 => getField<String>('Telefone2');
  set telefone2(String? value) => setField<String>('Telefone2', value);

  bool? get blacklist => getField<bool>('Blacklist');
  set blacklist(bool? value) => setField<bool>('Blacklist', value);

  bool? get proibidoAdiar => getField<bool>('Proibido Adiar');
  set proibidoAdiar(bool? value) => setField<bool>('Proibido Adiar', value);

  String? get nomeAbrevia => getField<String>('nome_abrevia');
  set nomeAbrevia(String? value) => setField<String>('nome_abrevia', value);

  String? get dataNascimento => getField<String>('data_nascimento');
  set dataNascimento(String? value) =>
      setField<String>('data_nascimento', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get emissorCnh => getField<String>('emissor_cnh');
  set emissorCnh(String? value) => setField<String>('emissor_cnh', value);

  String? get estadoCnh => getField<String>('estado_cnh');
  set estadoCnh(String? value) => setField<String>('estado_cnh', value);

  String? get numeroCnh => getField<String>('numero_cnh');
  set numeroCnh(String? value) => setField<String>('numero_cnh', value);

  DateTime? get dataDeEmissao => getField<DateTime>('data_de_emissao');
  set dataDeEmissao(DateTime? value) =>
      setField<DateTime>('data_de_emissao', value);
}
