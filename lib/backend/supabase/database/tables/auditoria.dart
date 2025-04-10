import '../database.dart';

class AuditoriaTable extends SupabaseTable<AuditoriaRow> {
  @override
  String get tableName => 'auditoria';

  @override
  AuditoriaRow createRow(Map<String, dynamic> data) => AuditoriaRow(data);
}

class AuditoriaRow extends SupabaseDataRow {
  AuditoriaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AuditoriaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get usuarioUuid => getField<String>('usuario_uuid');
  set usuarioUuid(String? value) => setField<String>('usuario_uuid', value);

  String? get acao => getField<String>('acao');
  set acao(String? value) => setField<String>('acao', value);

  String? get tabela => getField<String>('tabela');
  set tabela(String? value) => setField<String>('tabela', value);

  dynamic get dadosAntigos => getField<dynamic>('dados_antigos');
  set dadosAntigos(dynamic value) => setField<dynamic>('dados_antigos', value);

  dynamic get dadosNovos => getField<dynamic>('dados_novos');
  set dadosNovos(dynamic value) => setField<dynamic>('dados_novos', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get usuarioNome => getField<String>('usuario_nome');
  set usuarioNome(String? value) => setField<String>('usuario_nome', value);
}
