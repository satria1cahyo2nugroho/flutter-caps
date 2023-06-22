import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cap_pro/page/login.dart';
// import 'package:etilang_apps/dashboard.dart';

class HttpService{
  static final _client = http.Client();

  static var _registerUrl = Uri.parse('https://192.168.0.103:5000/signup');

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
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static flutter_login(String? email, String? password, BuildContext context) {}
}