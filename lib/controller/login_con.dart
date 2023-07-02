import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cap_pro/screens/material/convexbottom.dart';

class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('http://192.168.43.166:5000/login');

  static flutter_login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json[0] == 'Email salah!') {
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => convexbottombar()));
      }
    } else {}
  }
}