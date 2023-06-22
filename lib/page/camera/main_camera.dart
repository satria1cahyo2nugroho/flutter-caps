import 'package:flutter/material.dart';
import 'package:cap_pro/page/camera/camera_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MainCamera());
}

class MainCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraPage(),
    );
  }
}