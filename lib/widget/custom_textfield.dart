import 'package:flutter/material.dart';

Widget customTextField(
    TextEditingController controller,
    String hint, {
      bool obscure = false,
    }) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: Colors.white.withOpacity(0.08),
      ),
    ),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
      ),
    ),
  );
}
