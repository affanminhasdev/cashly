import '../database.dart';

class PalencaEarningsTable extends SupabaseTable<PalencaEarningsRow> {
  @override
  String get tableName => 'palenca_earnings';

  @override
  PalencaEarningsRow createRow(Map<String, dynamic> data) =>
      PalencaEarningsRow(data);
}

class PalencaEarningsRow extends SupabaseDataRow {
  PalencaEarningsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PalencaEarningsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get accountId => getField<String>('account_id');
  set accountId(String? value) => setField<String>('account_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get sobrenome => getField<String>('sobrenome');
  set sobrenome(String? value) => setField<String>('sobrenome', value);

  String? get earningDate => getField<String>('earning_date');
  set earningDate(String? value) => setField<String>('earning_date', value);

  String? get amount => getField<String>('amount');
  set amount(String? value) => setField<String>('amount', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get cashAmount => getField<String>('cash_amount');
  set cashAmount(String? value) => setField<String>('cash_amount', value);

  String? get countTrips => getField<String>('count_trips');
  set countTrips(String? value) => setField<String>('count_trips', value);
}
