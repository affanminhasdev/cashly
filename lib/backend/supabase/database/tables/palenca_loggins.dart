import '../database.dart';

class PalencaLogginsTable extends SupabaseTable<PalencaLogginsRow> {
  @override
  String get tableName => 'palenca_loggins';

  @override
  PalencaLogginsRow createRow(Map<String, dynamic> data) =>
      PalencaLogginsRow(data);
}

class PalencaLogginsRow extends SupabaseDataRow {
  PalencaLogginsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PalencaLogginsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
