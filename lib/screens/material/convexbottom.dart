import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:cap_pro/screens/streamlit.dart';
import 'package:cap_pro/screens/home.dart';
import 'package:cap_pro/page/camera/main_camera.dart';
import 'package:cap_pro/page/profile/profile_screen.dart';


class convexbottombar extends StatefulWidget {
  convexbottombar({Key? key}) : super (key: key);

  @override
  State<convexbottombar> createState() => _convexbottombarState();
}

class _convexbottombarState extends State<convexbottombar> {

final _pgno  = [const Pages(),MainCamera(),const WebviewPage(),const ProfileScreen()];

int _pilihtaksbar =0;
void _changetaksbar(int index){
  setState(() {
    _pilihtaksbar=index;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("convec"),
      ),
      body: _pgno[_pilihtaksbar],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        height: 60,
        activeColor: Colors.white,
        color: Colors.black ,
        items: [
        TabItem(icon: Icons.home, title: "Home"),
        TabItem(icon: Icons.camera, title: "camera"),
        TabItem(icon: Icons.language, title: "Data"),
        TabItem(icon: Icons.account_box, title: "profil")
        //TabItem(icon: Icons.exit_to_app, title: "exit")
      ],
      onTap: _changetaksbar,
      ),
    );
  }
}
