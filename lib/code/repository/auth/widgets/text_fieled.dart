import 'package:flutter/material.dart';

class TextFieledForAuth extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final TextEditingController? controller;
  const TextFieledForAuth({super.key, this.icon, this.label, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            fontStyle: FontStyle.normal,
            color: Colors.black),
        decoration: InputDecoration(
          label: Text(label.toString()),
          prefixIcon: icon,
          prefixIconColor: Colors.black,
          labelStyle: const TextStyle(
              fontSize: 20, fontStyle: FontStyle.normal, color: Colors.black),
        ),
      ),
    );
  }
}
