import 'dart:convert';
import 'dart:developer';

import 'package:bloc_test/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String url = ApiConstants.login;

  Future login(String username, String password, int langId) async {
    try {
      final response = await http.get(
        Uri.parse(
            "$url?mobileNumber=$username&password=$password&languageId=1"),
        // headers: {'Content-Type': 'application/json'},
      );
      log(response.body);
      log(response.statusCode.toString());

      final data = json.decode(response.body);
      return data;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
