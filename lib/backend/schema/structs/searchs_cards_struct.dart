// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchsCardsStruct extends BaseStruct {
  SearchsCardsStruct({
    int? id,
    String? nome,
    String? cpf,
    String? etapa,
    String? updatedAt,
  })  : _id = id,
        _nome = nome,
        _cpf = cpf,
        _etapa = etapa,
        _updatedAt = updatedAt;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  set cpf(String? val) => _cpf = val;

  bool hasCpf() => _cpf != null;

  // "etapa" field.
  String? _etapa;
  String get etapa => _etapa ?? '';
  set etapa(String? val) => _etapa = val;

  bool hasEtapa() => _etapa != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static SearchsCardsStruct fromMap(Map<String, dynamic> data) =>
      SearchsCardsStruct(
        id: castToType<int>(data['id']),
        nome: data['nome'] as String?,
        cpf: data['cpf'] as String?,
        etapa: data['etapa'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static SearchsCardsStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchsCardsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'cpf': _cpf,
        'etapa': _etapa,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'cpf': serializeParam(
          _cpf,
          ParamType.String,
        ),
        'etapa': serializeParam(
          _etapa,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchsCardsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchsCardsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        cpf: deserializeParam(
          data['cpf'],
          ParamType.String,
          false,
        ),
        etapa: deserializeParam(
          data['etapa'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SearchsCardsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchsCardsStruct &&
        id == other.id &&
        nome == other.nome &&
        cpf == other.cpf &&
        etapa == other.etapa &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nome, cpf, etapa, updatedAt]);
}

SearchsCardsStruct createSearchsCardsStruct({
  int? id,
  String? nome,
  String? cpf,
  String? etapa,
  String? updatedAt,
}) =>
    SearchsCardsStruct(
      id: id,
      nome: nome,
      cpf: cpf,
      etapa: etapa,
      updatedAt: updatedAt,
    );
