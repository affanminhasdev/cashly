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

Future<dynamic> enviarPropostaAPI(
  double value,
  String taxNumber,
  String personType,
  String releaseDate,
  String dueDate,
  double monthlyTax,
  int installments,
  int productId,
) async {
  // Token de autenticação

  String token = await generateAccessToken();

  // const String token =
  //     'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOjYzOSwidGFnX25hbWUiOiI2OWNkZjUxYy1lMjFmLTQ3ZGQtODQxMy1iYzMwNzJkNzI0OTgiLCJzY29wZSI6WyJhcGktZXh0ZXJuYWwiLCJhcGktY2FhcyJdLCJpYXQiOjE3NDM1MzA3NzUsImV4cCI6MTc0MzYxNzE3NX0.tCBiIHVpBGnRLwBfifCXH20pCTUA4q2XEYU2HJwa6KMgesa0mrvr0eb0-asvxShtn_k-nkWsOni3dGIO_AtS-MFqcAiPZw-MUcHUTCHjNCs3HnuUfU0Ojw8YrVqAKS_xceneFbaEywD0hn2zB1aBLri6hKhBO-6m-eSDqUL5nsQfmmf6mMCi6NH6CbCDS2af0J22htyJ99UbLVcpEb6Za4uYMzANQ0joPyoxjlwDEp5HQiWutBz-LTFKny1nFwNCSfQJPyxdrIylWUGtHlt8FYuFNcsnnEdigAvZ4VLQ8CGBJUolk07DM-vDcQQ4h9EiFCoP404vjL8AQkczpdwtJhTEzEexud1uC2w7oODes_2PxIf4tRaSVAmv48nmf9bzutJw3tUok_Iu0GpksIgqxNsC4oE_R2Uly2EoerVr4JIQA0_2ov65H7Fk5hCZj6dE34t9aSeKayTMDFnB5-BOuI4tebHGS0MQzjJdGPVFC6kwgN9BCy8BNCTrBwjnRrXpDYYKiWtFW37VhD8iOtDTgi47qmmDRi0uBNwiXQ50RTj_kC_EIJPua3MIIVRk7rbf9VsANYRrjFpLib0NB4K2Gm921yGRv4jkyEKYmhwwNOW8fMRvlsri9m27r1iQIsnMtMwXwVlm143GhkI8fTFYB3KZmSgxWFMn0t_KRzIZcXU';

  // Montando o payload
  final Map<String, dynamic> payload = {
    'only_simulation': true,
    'value': value,
    'tax_number': taxNumber,
    'person_type': personType,
    'release_date': releaseDate,
    'due_date': dueDate,
    'monthly_tax': monthlyTax,
    'installments': installments,
    'product_id': productId
  };

  print('Payload: $payload');

  try {
    // Realizando a chamada à API
    const String corsProxy = 'https://cors-anywhere.herokuapp.com/';
    const String apiUrl = corsProxy +
        'https://demo-api.easycredito.com.br/api/external/caas/simulation';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );
    print(response.body);

    // Verificando a resposta
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Retorna o resultado como um objeto dinâmico
      return jsonDecode(response.body);
    } else {
      // Trata erro da API
      print('Status Code: ${response.statusCode}');
      print(response.body);
      return {
        'success': false,
        'error': 'Erro na API: ${response.statusCode}',
        'message': response.body
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
