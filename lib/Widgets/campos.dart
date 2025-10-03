import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix, TextEditingController c) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      prefixText: prefix,
      border: OutlineInputBorder(),
    ),
    style: TextStyle(color: Colors.amber, fontSize: 18),
  );
}
