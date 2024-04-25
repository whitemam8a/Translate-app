import 'package:flutter/material.dart';

Widget callTextField(String text, TextEditingController controller) {
  return TextField(
    autofocus: true,
    controller: controller,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      hintText: text,
      fillColor: const Color.fromARGB(145, 116, 229, 244),
      filled: true,
    ),
  );
}
