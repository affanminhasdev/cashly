import '../database.dart';

class MotoristaVeiculoTable extends SupabaseTable<MotoristaVeiculoRow> {
  @override
  String get tableName => 'motorista_veiculo';

  @override
  MotoristaVeiculoRow createRow(Map<String, dynamic> data) =>
      MotoristaVeiculoRow(data);
}

class MotoristaVeiculoRow extends SupabaseDataRow {
  MotoristaVeiculoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MotoristaVeiculoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get motoristaId => getField<int>('motorista_id')!;
  set motoristaId(int value) => setField<int>('motorista_id', value);

  int get veiculoId => getField<int>('veiculo_id')!;
  set veiculoId(int value) => setField<int>('veiculo_id', value);
}
