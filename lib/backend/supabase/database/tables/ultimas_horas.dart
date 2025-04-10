import '../database.dart';

class UltimasHorasTable extends SupabaseTable<UltimasHorasRow> {
  @override
  String get tableName => 'ultimas_horas';

  @override
  UltimasHorasRow createRow(Map<String, dynamic> data) => UltimasHorasRow(data);
}

class UltimasHorasRow extends SupabaseDataRow {
  UltimasHorasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UltimasHorasTable();

  int? get jobid => getField<int>('jobid');
  set jobid(int? value) => setField<int>('jobid', value);

  int? get runid => getField<int>('runid');
  set runid(int? value) => setField<int>('runid', value);

  int? get jobPid => getField<int>('job_pid');
  set jobPid(int? value) => setField<int>('job_pid', value);

  String? get database => getField<String>('database');
  set database(String? value) => setField<String>('database', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get command => getField<String>('command');
  set command(String? value) => setField<String>('command', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get returnMessage => getField<String>('return_message');
  set returnMessage(String? value) => setField<String>('return_message', value);

  DateTime? get startTime => getField<DateTime>('start_time');
  set startTime(DateTime? value) => setField<DateTime>('start_time', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);
}
