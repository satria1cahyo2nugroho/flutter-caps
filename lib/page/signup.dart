import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cap_pro/page/login.dart';

//import '../controller/controller.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class SignupPage extends StatefulWidget {
  const SignupPage ({super.key});
  @override
  State<SignupPage> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<SignupPage> {
  late String name;
  late String email;
  late String password;
  late String re_password;

  final _formState = GlobalKey<FormState>();
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerRePassword = TextEditingController();

 Future<void> _signup() async {
    final String name = textControllerName.text;
    final String email = textControllerEmail.text;
    final String password = textControllerPassword.text;
    final String re_password = textControllerRePassword.text;

    final response = await http.post(
      Uri.parse('http://192.168.0.107:5000/signup'),
      body: jsonEncode({ 'email': email,'name':name, 'password': password, 're_password': re_password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      // ignore: unused_local_variable
      final Map<String, dynamic> responseData = json.decode(response.body);
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginPage())); 
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      // ignore: unused_local_variable
      final String errorMessage = errorData['message'];
      // TODO: Display login error message
    }
  }

  bool passVisible = false;
  @override
  void initState() {
    super.initState();
    passVisible = true;
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
                width: 10,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Email Address",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10, width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                controller: textControllerEmail,
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Mohon isi terlebih dahulu!";
                                  }
                                }),
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Email..',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                controller: textControllerName,
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Mohon isi terlebih dahulu!";
                                  }
                                }),
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.people),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Nama..',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                controller: textControllerPassword,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Mohon isi terlebih dahulu!";
                                  }
                                }),
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.password),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Password..',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Repeat Password",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    re_password = value;
                                  });
                                },
                                controller: textControllerRePassword,
                                validator: ((value) {
                                  if (value == '') {
                                    return "Mohon isi terlebih dahulu!";
                                  }
                                }),
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.repeat),
                                  border: InputBorder.none,
                                  hintText: 'Masukan re-Password..',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () async {
                          _signup();
                      },
                      child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
//                    const SizedBox(height: 30),
//                    InkWell(
 //                     onTap: () async {
//                        if (_formState.currentState!.validate()) {
//                          print("Validation Success");
//                          print("email : " + email);
//                          print("name : " + name);
//
//                          print("password : " + password);
//                          print("re_password : " + re_password);
//                          await HttpService.flutter_register(
//                              email, name, password, re_password, context);
//                        } else {
//                          print("Validation Error");
//                        }
//                      },
                    ),
                    ),
 //             Row(
 //               mainAxisAlignment: MainAxisAlignment.center,
 //               children: <Widget>[
 //                Text("Already have an account?"),
  //                Text(" Login", style:TextStyle(
   //                   fontWeight: FontWeight.w600,
   //                   fontSize: 18
   //               ),
   //               )
   //             ],              
   //           ),
              const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sudah punya akun?',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                        ),
                      ],
                    ),


                ],

          ),


        ),
            ]
  ),
      ),
    ));
  }
}