
import 'package:flutter/material.dart';
import 'package:cap_pro/page/signup.dart';
import 'package:cap_pro/screens/material/convexbottom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cap_pro/page/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;

  final _formState = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('http://192.168.0.107:5000/signin'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      final Map<String, dynamic> responseData = json.decode(response.body);
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => convexbottombar())); 
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
        margin: const EdgeInsets.symmetric(horizontal:10, vertical:20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 1),
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
                const SizedBox(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
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
                                controller: _emailController,
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
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Masukan Password",
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                controller: _passwordController,
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
                                  icon:  Icon(Icons.password),
                                  border: InputBorder.none,
                                  hintText: 'Masukan Password..',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                //Padding(
                 // padding: const EdgeInsets.symmetric(horizontal: 40),
                 // child: Column(
                  //  children: <Widget>[
                   //   inputFile(
                   //   label: "Email"),
                    // inputFile(
                    // label: "password", obscureText: true)
                   // ],
                  //),
               // ),
                  Padding(padding:
                  const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),

                          )
                        ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: (){
                          _login();
                        } ,
                        color: Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),

                      ),
                    ),
                  ),
                   Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fitHeight
                    ),

                  ),
                ),
                   const SizedBox(height: 10),
                    InkWell(
                      onTap:
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'dont have a account ?',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  color: Color(0xff14279B),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ],
            )
    )
                  ]
  )
      
  )
]
 )
 ) 
 )
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            ),

          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
