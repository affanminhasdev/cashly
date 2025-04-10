import '../database.dart';

class KanbanTable extends SupabaseTable<KanbanRow> {
  @override
  String get tableName => 'kanban';

  @override
  KanbanRow createRow(Map<String, dynamic> data) => KanbanRow(data);
}

class KanbanRow extends SupabaseDataRow {
  KanbanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KanbanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get coluna => getField<String>('coluna');
  set coluna(String? value) => setField<String>('coluna', value);
}
