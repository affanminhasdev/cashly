import '../database.dart';

class PlacasMotoristaTable extends SupabaseTable<PlacasMotoristaRow> {
  @override
  String get tableName => 'placas_motorista';

  @override
  PlacasMotoristaRow createRow(Map<String, dynamic> data) =>
      PlacasMotoristaRow(data);
}

class PlacasMotoristaRow extends SupabaseDataRow {
  PlacasMotoristaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlacasMotoristaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get motoristaId => getField<int>('motorista_id')!;
  set motoristaId(int value) => setField<int>('motorista_id', value);

  String get placa => getField<String>('placa')!;
  set placa(String value) => setField<String>('placa', value);
}
