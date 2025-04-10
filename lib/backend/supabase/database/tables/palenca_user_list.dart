import '../database.dart';

class PalencaUserListTable extends SupabaseTable<PalencaUserListRow> {
  @override
  String get tableName => 'palenca_user_list';

  @override
  PalencaUserListRow createRow(Map<String, dynamic> data) =>
      PalencaUserListRow(data);
}

class PalencaUserListRow extends SupabaseDataRow {
  PalencaUserListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PalencaUserListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get widgetId => getField<String>('widget_id');
  set widgetId(String? value) => setField<String>('widget_id', value);
}
