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

import '/custom_code/actions/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> customEnviarPropostaAPI(
  double value,
  String taxNumber,
  String releaseDate,
  String dueDate,
  double monthlyTax,
  int installments,
  int productId,
) async {
  // Montando o payload
  final Map<String, dynamic> payload = {
    'value': value,
    'tax_number': taxNumber,
    'release_date': releaseDate,
    'due_date': dueDate,
    'monthly_tax': monthlyTax,
    'installments': installments,
    'product_id': productId
  };

  print('Payload: $payload');

  try {
    // Realizando a chamada à API
    const String apiUrl = 'https://hooks.cashly.com.br/simulacao';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );
    print('Postman: ${response.body}');

    Map<String, dynamic> decodedResponse = jsonDecode(response.body);

    // Verificando a resposta
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Retorna o resultado como um objeto dinâmico

      return decodedResponse;
    } else {
      // Trata erro da API
      print('Status Code: ${response.statusCode}');
      print(response.body);
      return {
        'success': false,
        'error': 'Erro na API: ${response.statusCode}',
        'message': decodedResponse['message'],
      };
    }
  } catch (e) {
    // Trata erros de conexão ou outros
    print('Error on API: ${e.toString()}');
    return {
      'success': false,
      'error': 'Falha na conexão',
      'message': e.toString()
    };
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
