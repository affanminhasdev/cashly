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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> changePassword(
  String userId,
  String newPassword,
) async {
  // Instancia o cliente Supabase
  final supabase = SupaFlow.client;

  // Atualiza a senha do usuário pelo administrador
  final response = await supabase.auth.admin.updateUserById(
    userId,
    attributes: AdminUserAttributes(
      password: newPassword,
    ),
  );

  // Verifica se a atualização foi bem-sucedida
  return response.user != null; // Retorna true se o usuário foi atualizado
}
