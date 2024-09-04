import 'package:epredik_app/Login_and_SignUp/Login_page/Login.dart';
import 'package:epredik_app/Login_and_SignUp/SignUp_page/SignUp.dart';
import 'package:epredik_app/User_Page/Nav/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLogin extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonLogin({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 50,
      child: CupertinoButton(
        color: const Color(0xFFC8ACD6),
        onPressed: onPressed,
        child: Text(
          'Sign in',
          style: GoogleFonts.inter(
            color: const Color(0xFF17153B),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  const Button1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 50,
      child: CupertinoButton(
        color: const Color(0xFFC8ACD6).withOpacity(0.10),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
        child: Text(
          'Sign Up',
          style: GoogleFonts.inter(
            color: const Color(0xffffffff),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 50,
      child: CupertinoButton(
        color: const Color(0xFFC8ACD6).withOpacity(0.10),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text(
          'Sign In',
          style: GoogleFonts.inter(
            color: const Color(0xffffffff),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
