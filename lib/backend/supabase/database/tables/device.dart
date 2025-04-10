import '../database.dart';

class DeviceTable extends SupabaseTable<DeviceRow> {
  @override
  String get tableName => 'device';

  @override
  DeviceRow createRow(Map<String, dynamic> data) => DeviceRow(data);
}

class DeviceRow extends SupabaseDataRow {
  DeviceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeviceTable();

  int get idUser => getField<int>('id_user')!;
  set idUser(int value) => setField<int>('id_user', value);

  DateTime get dispositivoRegistadoA =>
      getField<DateTime>('dispositivo_registado_a')!;
  set dispositivoRegistadoA(DateTime value) =>
      setField<DateTime>('dispositivo_registado_a', value);

  String get deviceId => getField<String>('device_id')!;
  set deviceId(String value) => setField<String>('device_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get imei => getField<String>('imei');
  set imei(String? value) => setField<String>('imei', value);

  String? get fabricante => getField<String>('fabricante');
  set fabricante(String? value) => setField<String>('fabricante', value);

  String? get modelo => getField<String>('modelo');
  set modelo(String? value) => setField<String>('modelo', value);

  bool? get celularCashly => getField<bool>('celular_cashly');
  set celularCashly(bool? value) => setField<bool>('celular_cashly', value);

  bool? get bloquear => getField<bool>('bloquear');
  set bloquear(bool? value) => setField<bool>('bloquear', value);

  String? get lockStatus => getField<String>('lock_status');
  set lockStatus(String? value) => setField<String>('lock_status', value);

  double? get simCard => getField<double>('sim_card');
  set simCard(double? value) => setField<double>('sim_card', value);

  bool? get simCardCashly => getField<bool>('sim_card_cashly');
  set simCardCashly(bool? value) => setField<bool>('sim_card_cashly', value);

  String? get statusDeInscricao => getField<String>('status_de_inscricao');
  set statusDeInscricao(String? value) =>
      setField<String>('status_de_inscricao', value);

  double? get preco => getField<double>('preco');
  set preco(double? value) => setField<double>('preco', value);

  String? get idPedido => getField<String>('id_pedido');
  set idPedido(String? value) => setField<String>('id_pedido', value);

  String? get ultimaConexaoEm => getField<String>('ultima_conexao_em');
  set ultimaConexaoEm(String? value) =>
      setField<String>('ultima_conexao_em', value);

  DateTime? get matriculadoEm => getField<DateTime>('matriculado_em');
  set matriculadoEm(DateTime? value) =>
      setField<DateTime>('matriculado_em', value);

  String? get localizacao => getField<String>('localizacao');
  set localizacao(String? value) => setField<String>('localizacao', value);

  String? get estaAtivado => getField<String>('esta_ativado');
  set estaAtivado(String? value) => setField<String>('esta_ativado', value);

  String? get statusUso => getField<String>('status_uso');
  set statusUso(String? value) => setField<String>('status_uso', value);

  String? get tipoDevice => getField<String>('tipo_device');
  set tipoDevice(String? value) => setField<String>('tipo_device', value);

  bool? get isTv => getField<bool>('is_tv');
  set isTv(bool? value) => setField<bool>('is_tv', value);

  String? get deviceStateReason => getField<String>('device_state_reason');
  set deviceStateReason(String? value) =>
      setField<String>('device_state_reason', value);

  String? get deviceState => getField<String>('device_state');
  set deviceState(String? value) => setField<String>('device_state', value);

  String? get deviceCurrentState => getField<String>('device_current_state');
  set deviceCurrentState(String? value) =>
      setField<String>('device_current_state', value);

  String? get eventAt => getField<String>('event_at');
  set eventAt(String? value) => setField<String>('event_at', value);

  String? get event => getField<String>('event');
  set event(String? value) => setField<String>('event', value);

  String? get eventBy => getField<String>('event_by');
  set eventBy(String? value) => setField<String>('event_by', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
