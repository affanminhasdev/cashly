import '../database.dart';

class PalencaAccountsTable extends SupabaseTable<PalencaAccountsRow> {
  @override
  String get tableName => 'palenca_accounts';

  @override
  PalencaAccountsRow createRow(Map<String, dynamic> data) =>
      PalencaAccountsRow(data);
}

class PalencaAccountsRow extends SupabaseDataRow {
  PalencaAccountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PalencaAccountsTable();

  int get idUser => getField<int>('id_user')!;
  set idUser(int value) => setField<int>('id_user', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get sobrenome => getField<String>('sobrenome');
  set sobrenome(String? value) => setField<String>('sobrenome', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get idDoTrabalhador => getField<String>('id_do_trabalhador');
  set idDoTrabalhador(String? value) =>
      setField<String>('id_do_trabalhador', value);

  String? get veiculo => getField<String>('veiculo');
  set veiculo(String? value) => setField<String>('veiculo', value);

  String? get marca => getField<String>('marca');
  set marca(String? value) => setField<String>('marca', value);

  String? get modelo => getField<String>('modelo');
  set modelo(String? value) => setField<String>('modelo', value);

  String? get placa => getField<String>('placa');
  set placa(String? value) => setField<String>('placa', value);

  String? get imagemUrl => getField<String>('imagem_url');
  set imagemUrl(String? value) => setField<String>('imagem_url', value);

  String? get taxaDeAceitacao => getField<String>('taxa_de_aceitacao');
  set taxaDeAceitacao(String? value) =>
      setField<String>('taxa_de_aceitacao', value);

  String? get taxaDeCancelamento => getField<String>('taxa_de_cancelamento');
  set taxaDeCancelamento(String? value) =>
      setField<String>('taxa_de_cancelamento', value);

  String? get avaliacao => getField<String>('avaliacao');
  set avaliacao(String? value) => setField<String>('avaliacao', value);

  String? get viagens => getField<String>('viagens');
  set viagens(String? value) => setField<String>('viagens', value);

  String? get tempoDesdePrimeiraViagem =>
      getField<String>('tempo_desde_primeira_viagem');
  set tempoDesdePrimeiraViagem(String? value) =>
      setField<String>('tempo_desde_primeira_viagem', value);

  String? get levelName => getField<String>('level_name');
  set levelName(String? value) => setField<String>('level_name', value);

  String? get ano => getField<String>('ano');
  set ano(String? value) => setField<String>('ano', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get accountId => getField<String>('account_id');
  set accountId(String? value) => setField<String>('account_id', value);
}
