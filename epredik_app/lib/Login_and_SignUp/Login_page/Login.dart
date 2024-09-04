import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';

import 'package:epredik_app/Button_and_textfield/button_login.dart';
import 'package:epredik_app/Button_and_textfield/my_textfield.dart';
import 'package:epredik_app/ForgetPassword/EnterYourEmail.dart';
import 'package:epredik_app/Login_and_SignUp/SignUp_page/SignUp.dart';
import 'package:epredik_app/User_Page/Nav/nav.dart';
import 'package:epredik_app/backend/services/auth_user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;
  bool _isPasswordVisible = false; // Variable to track password visibility

  void login(BuildContext context) async {
    AuthServices authServices = AuthServices();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      isLoading = true;
    });

    String result = await authServices.login(email, password);
    if (result == 'success') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavUser()));
    } else {
      setState(() {
        errorMessage = result;
      });
    }

    Timer(const Duration(seconds: 5), () {
      setState(() {
        errorMessage = null;
      });
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool hasError = errorMessage != null;

    return Scaffold(
      backgroundColor: const Color(0xFF17153B),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/eplogoo.svg'),
                  const SizedBox(height: 20),
                  if (errorMessage != null) ...[
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                  ],
                  MyTextField(
                    hintText: "E-mail",
                    obscureText: false,
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFC8ACD6).withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordText(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Color(0xFFC8ACD6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ButtonLogin(
                    onPressed: () => login(context),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Color(0xFFC8ACD6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register Here",
                          style: TextStyle(
                            color: Color(0xFFC8ACD6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
