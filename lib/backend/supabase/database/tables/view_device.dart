import '../database.dart';

class ViewDeviceTable extends SupabaseTable<ViewDeviceRow> {
  @override
  String get tableName => 'view_device';

  @override
  ViewDeviceRow createRow(Map<String, dynamic> data) => ViewDeviceRow(data);
}

class ViewDeviceRow extends SupabaseDataRow {
  ViewDeviceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewDeviceTable();

  String? get deviceId => getField<String>('device_id');
  set deviceId(String? value) => setField<String>('device_id', value);

  DateTime? get dispositivoRegistadoA =>
      getField<DateTime>('dispositivo_registado_a');
  set dispositivoRegistadoA(DateTime? value) =>
      setField<DateTime>('dispositivo_registado_a', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get lockStatus => getField<String>('lock_status');
  set lockStatus(String? value) => setField<String>('lock_status', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
