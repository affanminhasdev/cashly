import '../database.dart';

class PalencaAccountListTable extends SupabaseTable<PalencaAccountListRow> {
  @override
  String get tableName => 'palenca_account_list';

  @override
  PalencaAccountListRow createRow(Map<String, dynamic> data) =>
      PalencaAccountListRow(data);
}

class PalencaAccountListRow extends SupabaseDataRow {
  PalencaAccountListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PalencaAccountListTable();

  String? get accountId => getField<String>('account_id');
  set accountId(String? value) => setField<String>('account_id', value);

  String? get criadoEm => getField<String>('criado_em');
  set criadoEm(String? value) => setField<String>('criado_em', value);

  String? get ultimaConexaoComSucesso =>
      getField<String>('ultima_conexao_com_sucesso');
  set ultimaConexaoComSucesso(String? value) =>
      setField<String>('ultima_conexao_com_sucesso', value);

  String? get plataforma => getField<String>('plataforma');
  set plataforma(String? value) => setField<String>('plataforma', value);

  String? get pais => getField<String>('pais');
  set pais(String? value) => setField<String>('pais', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
