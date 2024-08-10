// lib/features/sign_up/repo/sign_up_repo.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user_model.dart';

class SignUpRepo {
  final String apiUrl = 'https://your-api-endpoint.com/signup';

  Future<void> signUp(UserModel user) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }
}