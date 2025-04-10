// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioStruct extends BaseStruct {
  UsuarioStruct({
    String? nome,
    String? email,
    int? role,
    String? cor,
  })  : _nome = nome,
        _email = email,
        _role = role,
        _cor = cor;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  set role(int? val) => _role = val;

  void incrementRole(int amount) => role = role + amount;

  bool hasRole() => _role != null;

  // "cor" field.
  String? _cor;
  String get cor => _cor ?? '';
  set cor(String? val) => _cor = val;

  bool hasCor() => _cor != null;

  static UsuarioStruct fromMap(Map<String, dynamic> data) => UsuarioStruct(
        nome: data['nome'] as String?,
        email: data['email'] as String?,
        role: castToType<int>(data['role']),
        cor: data['cor'] as String?,
      );

  static UsuarioStruct? maybeFromMap(dynamic data) =>
      data is Map ? UsuarioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'email': _email,
        'role': _role,
        'cor': _cor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.int,
        ),
        'cor': serializeParam(
          _cor,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsuarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuarioStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.int,
          false,
        ),
        cor: deserializeParam(
          data['cor'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsuarioStruct &&
        nome == other.nome &&
        email == other.email &&
        role == other.role &&
        cor == other.cor;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, email, role, cor]);
}

UsuarioStruct createUsuarioStruct({
  String? nome,
  String? email,
  int? role,
  String? cor,
}) =>
    UsuarioStruct(
      nome: nome,
      email: email,
      role: role,
      cor: cor,
    );
