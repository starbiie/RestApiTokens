import 'dart:convert';

import 'package:apitokens/Api/api.dart';
import 'package:apitokens/model/model_user.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AuthServices {
  final client = http.Client();
  Future<UserModel?> login(String username, String password) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await client.post(
        Uri.parse('${Api().baseUrl}${Api().authUrl}'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final result = UserModel.fromJson(jsonDecode(response.body));
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setString('token', result.token.toString());
        return result;
      } else {
        // Handle non-200 responses here
        print('Failed to login: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print(error);
      return null; // Ensure null is returned on error
    }
  }

}
