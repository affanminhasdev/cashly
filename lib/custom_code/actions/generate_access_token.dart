// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

const String corsProxy = 'https://cors-anywhere.herokuapp.com/';
const String authUrl =
    corsProxy + 'https://auth.easycredito.com.br/client/auth';

//const String authUrl = 'https://auth.easycredito.com.br/client/auth';
const String clientId = '69cdf51c-e21f-47dd-8413-bc3072d72498';
const String clientSecret =
    'a8e944c664657245ea7e74cb9034e3036c682a1a91b08d265483dafb376afd97';
const List<String> scopes = ['api-external', 'api-caas'];

Future<String> generateAccessToken() async {
  try {
    final Map<String, dynamic> payload = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'scopes': scopes
    };

    final http.Response response = await http.post(
      Uri.parse(authUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String? accessToken = data['access_token'];

      if (accessToken != null) {
        print('Autenticação bem-sucedida!');
        print('Access Token: $accessToken');
        return accessToken;
      } else {
        print('Autenticação falhou: Token não encontrado na resposta.');
        throw Exception(response.body);
      }
    } else {
      print('Falha na autenticação. Status Code: ${response.statusCode}');
      print('Resposta: ${response.body}');
      throw Exception(response.body);
    }
  } catch (error) {
    print('Erro na autenticação: $error');
    throw Exception(error.toString());
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
