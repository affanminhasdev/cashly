import '../database.dart';

class WebhookQueueTable extends SupabaseTable<WebhookQueueRow> {
  @override
  String get tableName => 'webhook_queue';

  @override
  WebhookQueueRow createRow(Map<String, dynamic> data) => WebhookQueueRow(data);
}

class WebhookQueueRow extends SupabaseDataRow {
  WebhookQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WebhookQueueTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get processedAt => getField<DateTime>('processed_at');
  set processedAt(DateTime? value) => setField<DateTime>('processed_at', value);

  bool? get success => getField<bool>('success');
  set success(bool? value) => setField<bool>('success', value);

  String? get errorMessage => getField<String>('error_message');
  set errorMessage(String? value) => setField<String>('error_message', value);

  dynamic get payload => getField<dynamic>('payload')!;
  set payload(dynamic value) => setField<dynamic>('payload', value);

  String get webhookUrl => getField<String>('webhook_url')!;
  set webhookUrl(String value) => setField<String>('webhook_url', value);
}
