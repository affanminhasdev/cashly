import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase Group Code

class SupabaseGroup {
  static String getBaseUrl() => 'https://datalake.cashly.com.br/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
  };
  static PaginacaoLeadsCall paginacaoLeadsCall = PaginacaoLeadsCall();
  static CriarUsuarioCall criarUsuarioCall = CriarUsuarioCall();
  static TrocarSenhaCall trocarSenhaCall = TrocarSenhaCall();
  static BuscaLeadCall buscaLeadCall = BuscaLeadCall();
  static DeletarUsuarioCall deletarUsuarioCall = DeletarUsuarioCall();
}

class PaginacaoLeadsCall {
  Future<ApiCallResponse> call({
    int? ini,
    int? fim,
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Paginacao Leads',
      apiUrl:
          '${baseUrl}rest/v1/lead?select=id,nome,cpf,etapa,updated_at&order=created_at.desc',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
        'Range': '${ini}-${fim}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarUsuarioCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
    String? nome = '',
    int? role,
    String? cor = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "nome": "${escapeStringForJson(nome)}",
  "email": "${escapeStringForJson(email)}",
  "senha": "${escapeStringForJson(senha)}",
  "role": ${role},
  "cor": "${escapeStringForJson(cor)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Usuario',
      apiUrl: '${baseUrl}functions/v1/create-user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TrocarSenhaCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? senha = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "uid": "${escapeStringForJson(uid)}",
  "novaSenha": "${escapeStringForJson(senha)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Trocar senha',
      apiUrl: '${baseUrl}/functions/v1/change-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscaLeadCall {
  Future<ApiCallResponse> call({
    String? busca = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "query": "${escapeStringForJson(busca)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Busca Lead',
      apiUrl: '${baseUrl}/rest/v1/rpc/search_lead',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? nome(dynamic response) => (getJsonField(
        response,
        r'''$[:].nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cpf(dynamic response) => (getJsonField(
        response,
        r'''$[:].cpf''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? telefone(dynamic response) => (getJsonField(
        response,
        r'''$[:].telefone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? etapa(dynamic response) => (getJsonField(
        response,
        r'''$[:].etapa''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updated(dynamic response) => (getJsonField(
        response,
        r'''$[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeletarUsuarioCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(uuid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Deletar Usuario',
      apiUrl: '${baseUrl}//functions/v1/delete-user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzI3OTI0NDAwLAogICJleHAiOiAxODg1NjkwODAwCn0.l6dhuDeAu9qg7mvocRfBqKGHoksn2H6kqSqlGqSKAsA',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Supabase Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
