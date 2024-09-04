import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.inter(
          textStyle: const TextStyle(color: Colors.white),
          fontSize: 14,
          fontWeight: FontWeight.w500),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: const Color(0xFFC8ACD6).withOpacity(0.2),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
