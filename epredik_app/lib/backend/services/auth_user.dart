import 'dart:convert';
import 'package:epredik_app/backend/utils/constant.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<String> signUp(String email, String username, String password,
      String school, String strand) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('${Constant.uri}/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'username': username,
          'school': school,
          'strand': strand,
        }),
      );

      if (res.statusCode == 201) {
        print('Registration Successful');
        return 'success'; 
      } else {
        final Map<String, dynamic> responseBody = jsonDecode(res.body);
        String errorMessage = responseBody['error'] ?? 'Failed to register';
        print('Failed to register: $errorMessage');
        return errorMessage;
      }
    } catch (err) {
      print('An error occurred: $err');
      return 'An error occurred: $err';
    }
  }

  Future<String> login(String email, String password) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('${Constant.uri}/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (res.statusCode == 200) {
        print('Login Successful');
        return 'success';
      } else {
        final Map<String, dynamic> responseBody = jsonDecode(res.body);
        String errorMessage = responseBody['error'] ?? 'Failed to login';
        print('Failed to login: $errorMessage');
        return errorMessage;
      }
    } catch (err) {
      print('An error occurred: $err');
      return 'An error occurred: $err';
    }
  }
}