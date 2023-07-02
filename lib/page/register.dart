import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cap_pro/page/login.dart';

import 'package:cap_pro/controller/controller.dart';



class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late String name;
  late String email;
  late String password;
  late String re_password;

  final _formState = GlobalKey<FormState>();
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerRePassword = TextEditingController();

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
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
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
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.people),
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
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
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
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
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
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.repeat),
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
                        color: Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () async {
                        if (_formState.currentState!.validate()) {
                          print("Validation Success");
                          print("email : " + email);
                          print("name : " + name);

                          print("password : " + password);
                          print("re_password : " + re_password);
                          await HttpService.flutter_register(
                              email, name, password, re_password, context);
                        } else {
                          print("Validation Error");
                        }
                      },
                        child: const Text(
                          "SignUp", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),

                      ),

                    ),
                    const SizedBox(height: 20),
                    Row(
                      
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
                                color: Color.fromARGB(255, 141, 20, 206),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
