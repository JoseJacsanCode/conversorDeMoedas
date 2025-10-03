import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix, TextEditingController c, ValueChanged<String> f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      prefixText: prefix,
      border: const OutlineInputBorder(),
    ),
    style: TextStyle(color: Colors.amber, fontSize: 18),
    onChanged: f,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
