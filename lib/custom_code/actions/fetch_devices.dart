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

Future<List<DeviceRow>> fetchDevices() async {
  final supabaseClient = SupaFlow.client;
  final response = await supabaseClient
      .rpc('get_all_devices'); // Calling the function created in Supabase

  print('Response device: ${response}');
  if (response != null) {
    // If the response is successful, store the data in the devices list
    return List<DeviceRow>.from(
        response.map((device) => DeviceTable().createRow(device)));
  } else {
    // Handle the error if the query fails
    print('Error fetching devices: ${response.error!.message}');
    return [];
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
