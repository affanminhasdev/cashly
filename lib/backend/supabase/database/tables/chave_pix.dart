import '../database.dart';

class ChavePixTable extends SupabaseTable<ChavePixRow> {
  @override
  String get tableName => 'chave_pix';

  @override
  ChavePixRow createRow(Map<String, dynamic> data) => ChavePixRow(data);
}

class ChavePixRow extends SupabaseDataRow {
  ChavePixRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChavePixTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get ativo => getField<String>('ativo');
  set ativo(String? value) => setField<String>('ativo', value);

  String? get conta => getField<String>('conta');
  set conta(String? value) => setField<String>('conta', value);

  String? get agencia => getField<String>('agencia');
  set agencia(String? value) => setField<String>('agencia', value);

  DateTime? get dataAlteracao => getField<DateTime>('data_alteracao');
  set dataAlteracao(DateTime? value) =>
      setField<DateTime>('data_alteracao', value);

  DateTime? get dataInclusao => getField<DateTime>('data_inclusao');
  set dataInclusao(DateTime? value) =>
      setField<DateTime>('data_inclusao', value);

  String? get banco => getField<String>('banco');
  set banco(String? value) => setField<String>('banco', value);

  int? get idChave => getField<int>('id_chave');
  set idChave(int? value) => setField<int>('id_chave', value);

  String? get chavePix => getField<String>('chave_pix');
  set chavePix(String? value) => setField<String>('chave_pix', value);

  int? get chavePlano => getField<int>('chave_plano');
  set chavePlano(int? value) => setField<int>('chave_plano', value);

  String? get digitoBanco => getField<String>('digito_banco');
  set digitoBanco(String? value) => setField<String>('digito_banco', value);
}
