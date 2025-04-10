import '../database.dart';

class MotoristaTable extends SupabaseTable<MotoristaRow> {
  @override
  String get tableName => 'motorista';

  @override
  MotoristaRow createRow(Map<String, dynamic> data) => MotoristaRow(data);
}

class MotoristaRow extends SupabaseDataRow {
  MotoristaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MotoristaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  double? get whatsapp => getField<double>('whatsapp');
  set whatsapp(double? value) => setField<double>('whatsapp', value);

  String? get placa => getField<String>('placa');
  set placa(String? value) => setField<String>('placa', value);

  int? get veiculoId => getField<int>('veiculo_id');
  set veiculoId(int? value) => setField<int>('veiculo_id', value);

  String? get token => getField<String>('token');
  set token(String? value) => setField<String>('token', value);
}
