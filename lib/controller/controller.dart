import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cap_pro/page/login.dart';

class HttpService{
  static final _client = http.Client();

  static final _registerUrl = Uri.parse('http://192.168.100.164:5000/signup');

  static flutter_register(email, name, password, re_password, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      "email": email,
      "name": name,
      "password": password,
      "re_password": re_password,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // Jika sudah ada maka tidak dapat masuk
      if (json[0] == 'Email Telah digunakan!') {
        // EasyLoading.showError(json[0]);
      } else {
        // Jika data tidak ada maka akan masuk ke menu selanjutnya
        // await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    } else {
      //final Map<String, dynamic> errorData = json.decode(response.body);
      // ignore: unused_local_variable
      //final String errorMessage = errorData['message'];
      //await EasyLoading.showError(
      //    "Error Code : ${response.statusCode.toString()}");
    }
  }

  static flutter_login(String? email, String? password, BuildContext context) {}
}