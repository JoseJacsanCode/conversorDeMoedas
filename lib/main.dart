import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = 'https://api.hgbrasil.com/finance?key=3a99a790';

void main() async {
  runApp(MaterialApp(home: Container()));
}

Future<Map> getData() async {
  http.Response response = await http.get(request as Uri);
  return json.decode(response.body);
}
