import 'package:flutter/material.dart';

class CustomCommentFieled extends StatelessWidget {
  const CustomCommentFieled(
      {super.key, this.controller, this.onTap, this.label});
  final TextEditingController? controller;
  final Widget? label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            fontStyle: FontStyle.normal,
            color: Colors.black),
        decoration: InputDecoration(
          label: label,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          prefixIconColor: Colors.black,
          suffixIcon: Icon(
            Icons.send_sharp,
            size: h * 0.03,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
