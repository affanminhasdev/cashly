import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_Usuario') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_Usuario') ?? '{}';
          _Usuario =
              UsuarioStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _lastCheckedIds =
          await secureStorage.getStringList('ff_lastCheckedIds') ??
              _lastCheckedIds;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<SearchsCardsStruct> _CrmCards = [];
  List<SearchsCardsStruct> get CrmCards => _CrmCards;
  set CrmCards(List<SearchsCardsStruct> value) {
    _CrmCards = value;
  }

  void addToCrmCards(SearchsCardsStruct value) {
    CrmCards.add(value);
  }

  void removeFromCrmCards(SearchsCardsStruct value) {
    CrmCards.remove(value);
  }

  void removeAtIndexFromCrmCards(int index) {
    CrmCards.removeAt(index);
  }

  void updateCrmCardsAtIndex(
    int index,
    SearchsCardsStruct Function(SearchsCardsStruct) updateFn,
  ) {
    CrmCards[index] = updateFn(_CrmCards[index]);
  }

  void insertAtIndexInCrmCards(int index, SearchsCardsStruct value) {
    CrmCards.insert(index, value);
  }

  int _Ini = 0;
  int get Ini => _Ini;
  set Ini(int value) {
    _Ini = value;
  }

  int _Fim = 30;
  int get Fim => _Fim;
  set Fim(int value) {
    _Fim = value;
  }

  UsuarioStruct _Usuario = UsuarioStruct();
  UsuarioStruct get Usuario => _Usuario;
  set Usuario(UsuarioStruct value) {
    _Usuario = value;
    secureStorage.setString('ff_Usuario', value.serialize());
  }

  void deleteUsuario() {
    secureStorage.delete(key: 'ff_Usuario');
  }

  void updateUsuarioStruct(Function(UsuarioStruct) updateFn) {
    updateFn(_Usuario);
    secureStorage.setString('ff_Usuario', _Usuario.serialize());
  }

  int _SelectedCRM = -1;
  int get SelectedCRM => _SelectedCRM;
  set SelectedCRM(int value) {
    _SelectedCRM = value;
  }

  String _selectedFilter = 'TOTAL';
  String get selectedFilter => _selectedFilter;
  set selectedFilter(String value) {
    _selectedFilter = value;
  }

  List<String> _devices = ['3845362', '6299975', '6336793'];
  List<String> get devices => _devices;
  set devices(List<String> value) {
    _devices = value;
  }

  void addToDevices(String value) {
    devices.add(value);
  }

  void removeFromDevices(String value) {
    devices.remove(value);
  }

  void removeAtIndexFromDevices(int index) {
    devices.removeAt(index);
  }

  void updateDevicesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    devices[index] = updateFn(_devices[index]);
  }

  void insertAtIndexInDevices(int index, String value) {
    devices.insert(index, value);
  }

  List<String> _lastCheckedIds = [];
  List<String> get lastCheckedIds => _lastCheckedIds;
  set lastCheckedIds(List<String> value) {
    _lastCheckedIds = value;
    secureStorage.setStringList('ff_lastCheckedIds', value);
  }

  void deleteLastCheckedIds() {
    secureStorage.delete(key: 'ff_lastCheckedIds');
  }

  void addToLastCheckedIds(String value) {
    lastCheckedIds.add(value);
    secureStorage.setStringList('ff_lastCheckedIds', _lastCheckedIds);
  }

  void removeFromLastCheckedIds(String value) {
    lastCheckedIds.remove(value);
    secureStorage.setStringList('ff_lastCheckedIds', _lastCheckedIds);
  }

  void removeAtIndexFromLastCheckedIds(int index) {
    lastCheckedIds.removeAt(index);
    secureStorage.setStringList('ff_lastCheckedIds', _lastCheckedIds);
  }

  void updateLastCheckedIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    lastCheckedIds[index] = updateFn(_lastCheckedIds[index]);
    secureStorage.setStringList('ff_lastCheckedIds', _lastCheckedIds);
  }

  void insertAtIndexInLastCheckedIds(int index, String value) {
    lastCheckedIds.insert(index, value);
    secureStorage.setStringList('ff_lastCheckedIds', _lastCheckedIds);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
