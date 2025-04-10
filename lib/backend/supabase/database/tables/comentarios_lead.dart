import '../database.dart';

class ComentariosLeadTable extends SupabaseTable<ComentariosLeadRow> {
  @override
  String get tableName => 'comentarios_lead';

  @override
  ComentariosLeadRow createRow(Map<String, dynamic> data) =>
      ComentariosLeadRow(data);
}

class ComentariosLeadRow extends SupabaseDataRow {
  ComentariosLeadRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ComentariosLeadTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get lead => getField<int>('lead');
  set lead(int? value) => setField<int>('lead', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get comentario => getField<String>('comentário');
  set comentario(String? value) => setField<String>('comentário', value);

  String? get cor => getField<String>('cor');
  set cor(String? value) => setField<String>('cor', value);
}
