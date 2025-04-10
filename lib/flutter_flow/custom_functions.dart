import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<SearchsCardsStruct>? addList(
  List<SearchsCardsStruct>? list1,
  List<SearchsCardsStruct>? list2,
) {
  // une as duas listas e retorna
  if (list1 == null && list2 == null) {
    return null;
  } else if (list1 == null) {
    return list2;
  } else if (list2 == null) {
    return list1;
  } else {
    list1.addAll(list2);
    return list1;
  }
}

String returnColor(Color color) {
  return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
}

List<UsuariosRow>? searchUsers(
  String? busca,
  List<UsuariosRow>? users,
) {
  // Retorna null ou lista vazia se os parâmetros forem inválidos
  if (busca == null || busca.isEmpty || users == null || users.isEmpty) {
    return users;
  }

  // Converte a busca para letras minúsculas para busca case-insensitive
  final query = busca.toLowerCase();

  // Filtra os usuários com base na busca (nome ou email)
  return users.where((user) {
    final nome = user.nome?.toLowerCase() ?? '';
    final email = user.email?.toLowerCase() ?? '';
    return nome.contains(query) || email.contains(query);
  }).toList();
}

List<String> sellerList(List<String>? list) {
  // recebe uma lista de strings e acrescenta a palavra "Todos" na primeira posição
  if (list == null) {
    return ['Todos'];
  } else {
    list.insert(0, 'Todos');
    return list;
  }
}

List<LeadRow>? returnLeadsKanban(
  List<LeadRow>? leads,
  String vendedor,
) {
  // Retorna a lista completa se for nula, vazia ou o vendedor for "Todos"
  if (leads == null || leads.isEmpty || vendedor == "Todos") {
    return leads;
  }

  // Filtra os leads pelo responsável
  return leads.where((lead) => lead.responsavel == vendedor).toList();
}

double? calculateInterest(
  double? juros,
  double? valor,
  int? prazo,
) {
  if (juros == null || valor == null || prazo == null || prazo <= 0) {
    return null; // Retorna null se algum parâmetro for inválido
  }

  double jurosMensal = juros / 100; // Converte para decimal
  double potencia =
      math.pow(1 + jurosMensal, prazo).toDouble(); // Faz o cast para double
  double resultado = valor * (jurosMensal * potencia) / (potencia - 1);

  // Trunca para 2 decimais
  return (resultado * 100).truncateToDouble() / 100;
}

String formatReal(String? value) {
  // String cleanValue = value?.replaceAll(RegExp('[^0-9]'), '') ?? '';

  // // Checa se a entrada limpa está vazia
  // if (cleanValue.isEmpty) {
  //   return '';
  // }

  // // Cria o formatador de número para o formato de moeda brasileiro sem símbolo
  // final numberFormat = NumberFormat.currency(locale: 'pt_BR', symbol: '');

  // // Tenta converter o valor limpo para double
  // double? doubleValue = double.tryParse(cleanValue);

  // // Verifica se doubleValue é nulo ou zero, retorna string vazia se verdadeiro
  // if (doubleValue == null || doubleValue == 0) {
  //   return '';
  // }

  // // Formata o valor para moeda, dividindo por 100 para converter centavos em reais
  // return numberFormat.format(doubleValue / 100);

  String cleanValue = value?.replaceAll(RegExp('[^0-9]'), '') ?? '';

  if (cleanValue.isEmpty) {
    return '';
  }

  // Convert clean value to a double and divide by 100 for cents
  double doubleValue = double.tryParse(cleanValue) ?? 0;

  if (doubleValue == 0) {
    return '';
  }

  // Format as currency
  final numberFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 2,
  );

  return numberFormat.format(doubleValue / 100);
}

double? convertToDouble(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null; // Retorna null em vez de string
  }

  // Remove caracteres não numéricos, exceto vírgulas e pontos
  String cleanedValue = value.replaceAll(RegExp(r'[^\d,.-]'), '');

  // Substitui vírgulas por pontos para normalizar o formato decimal
  String normalizedValue =
      cleanedValue.replaceAll('.', '').replaceAll(',', '.');

  // Tenta converter para double
  try {
    return double.parse(normalizedValue);
  } catch (e) {
    return null; // Retorna null se a conversão falhar
  }
}

double containerPaymentSize(int? rows) {
  if (rows == null || rows <= 0) {
    // Valor mínimo se não houver linhas
    return 100.0; // Tamanho mínimo para exibição.
  }

  // Altura do header (45 pixels) + altura de cada linha (45 pixels por linha)
  // Adiciona uma folga de 20 pixels.
  return 45 + (rows * 45) + 25;
}

List<String> getDeviceList(List<PlanoRow> planos) {
  //List<String> devices = [];
  Set<String> deviceSet = {};
  for (PlanoRow plano in planos) {
    //devices.addAll(plano.deviceList);
    deviceSet.addAll(plano.deviceList);

    print(plano.deviceList);
  }

  print('Final List: ${deviceSet}');
  print('List: ${deviceSet.toList()}');

  //return devices;
  return deviceSet.toList();
}

String formatField(String? value) {
  // Remove all non-digit characters.
  String cleanValue = value?.replaceAll(RegExp('[^0-9]'), '') ?? '';

  // Check if the cleaned value is empty
  if (cleanValue.isEmpty) {
    return '';
  }

  // Parse the number as an integer (centavos)
  int? intValue = int.tryParse(cleanValue);

  // Return empty string if parsing fails
  if (intValue == null) {
    return '';
  }

  // Format the number as a currency without the symbol
  final numberFormat =
      NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2);

  // Divide by 100 to properly handle cents
  return numberFormat.format(intValue / 100);
}

String? getPostergarByNumber(
  List<String> dataList,
  int? number,
) {
  if (number == null) return null;

  for (var entry in dataList) {
    if (entry.startsWith('$number ')) {
      return entry;
    }
  }
  return 'Not found';
}

int? getNumberFromPostergar(
  List<String> dataList,
  String value,
) {
  for (var entry in dataList) {
    if (entry == value) {
      // Extract the day number (first part of the string)
      return int.tryParse(entry.split(' ')[0]);
    }
  }

  return null;
}

List<String> filterDevicesAtTop(
  List<String> allDevices,
  List<String> selectedDevices,
) {
  List<String> devices = [
    ...allDevices.where((device) => selectedDevices.contains(device) == false)
  ];

  return [...selectedDevices, ...devices];
}

DateTime getCustomDateTime() {
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day, 23, 0);
}

dynamic parseFitbankJson(String? jsonString) {
  if (jsonString == null || jsonString.isEmpty) {
    return {};
  }
  return json.decode(jsonString);
}

String? getReceiverName(String? jsonString) {
  final map = parseFitbankJson(jsonString);
  return map['ReceiverName'] ?? '';
}

String? getFullFitbankInfo(String? jsonString) {
  if (jsonString == null || jsonString.isEmpty) {
    return '';
  }
  final map = parseFitbankJson(jsonString);

  // Pegando os 3 valores do JSON
  String name = map['ReceiverName'] ?? '';
  String taxNumber = map['ReceiverTaxNumber'] ?? '';
  String bankName = map['ReceiverBankName'] ?? '';

  // Retornando tudo na mesma linha
  return '$name, $taxNumber, $bankName';
}

String? maskCPF(String? cpf) {
  if (cpf == null || cpf.length != 11)
    return '***.***.***-**'; // Retorno padrão se não for válido

  return "***.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-**";
}

List<SearchsCardsStruct> updateCrmCards(
  List<SearchsCardsStruct> crmCards,
  int id,
) {
  print('id: $id');

  print('Length of cards: ${crmCards.length}');
  print('Cards: ${crmCards}');

  List<SearchsCardsStruct> finalCards =
      crmCards.where((item) => item.id != id).toList();
  print('Length of final cards: ${finalCards.length}');
  print('Final Cards: ${finalCards}');

  return finalCards;
}

DateTime? set2300() {
  return DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    23,
    0,
  );
}

DateTime addMoreHours(
  DateTime date,
  int hours,
) {
  return date.add(Duration(hours: hours));
}

String getDateFormated(String? date) {
  if (date != null) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  return 'null';
}

bool checkApiSuccess(dynamic response) {
  return response['success'];
}
