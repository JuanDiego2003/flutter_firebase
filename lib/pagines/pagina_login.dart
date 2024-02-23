// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/noto_auth.dart';
import 'package:flutter_firebase/components/textfield_auth.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 183, 159),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo
                  const Icon(
                    Icons.fireplace,
                    size: 120,
                    color: Color.fromARGB(255, 255, 240, 218),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //Frase
                  const Text(
                    "Bienvenido",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 240, 218),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Text divisori
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 5,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Fes login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 218),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 5,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //TextField Email
                  TextFieldAuth(
                      controller: controllerEmail,
                      hintText: "Email",
                      obscureText: false),
                  SizedBox(
                    height: 10,
                  ),
                  //textField Password
                  TextFieldAuth(
                      controller: controllerPassword,
                      hintText: "Password",
                      obscureText: true),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("No ets membre?"),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Text(
                            "Registra't",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 40, 71, 97)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                //Botó Login.
                BotoAuth(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
