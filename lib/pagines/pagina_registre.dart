import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/servei_auth.dart';
import 'package:flutter_firebase/components/noto_auth.dart';
import 'package:flutter_firebase/components/textfield_auth.dart';

class PaginaRegistre extends StatefulWidget {
  final void Function() alFenClic;
  PaginaRegistre({super.key, required this.alFenClic});

  @override
  State<PaginaRegistre> createState() => _PaginaRegistreState();
}

class _PaginaRegistreState extends State<PaginaRegistre> {
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();

  final TextEditingController controllerConfirmarPassword =
      TextEditingController();

  void ferRegistre(BuildContext context) async {
    final serveiAuth = ServeiAuth();
    final TextEditingController controllerConfirmarPassword =
        TextEditingController();
    try {
      serveiAuth.registreAmbEmailIPassword(
        controllerEmail.text,
        controllerPassword.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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

                  const SizedBox(
                    height: 25,
                  ),

                  //Frase
                  const Text(
                    "Crea un compte nou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 240, 218),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //Text divisori
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
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
                            "Registre",
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

                  const SizedBox(
                    height: 10,
                  ),

                  //textField Password
                  TextFieldAuth(
                      controller: controllerPassword,
                      hintText: "Password",
                      obscureText: true),

                  const SizedBox(
                    height: 10,
                  ),

                  //No estas refistrat
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Ja ets memebre?"),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: widget.alFenClic,
                          child: const Text(
                            "Fes Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 40, 71, 97)),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Boto Login
                  BotoAuth(
                    text: "Resgistre",
                    onTap:()=> ferRegistre(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
