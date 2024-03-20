import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/servei_auth.dart';
import 'package:flutter_firebase/components/noto_auth.dart';
import 'package:flutter_firebase/components/textfield_auth.dart';

class PaginaLogin extends StatefulWidget {
  final void Function() alFenClic;
  const PaginaLogin({
    super.key,
    required this.alFenClic
    });
  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  void ferLogin(BuildContext context) async {
    
    final serveiAuth = ServeiAuth();

    try {

      await serveiAuth.loginAmbEmailIPassword(
        controllerEmail.text, 
        controllerPassword.text,
      );

    } catch (e) {

      // ignore: use_build_context_synchronously
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
                  const SizedBox(
                    height: 25,
                  ),
                  //Text divisori
                  Padding(
                    padding: EdgeInsets.all(8.0),
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
                          onTap: widget.alFenClic,
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
                  SizedBox(
                    height: 10,
                  ),
                  //Botó Login.
                  BotoAuth(
                    text: "Login",
                    onTap: ()=> ferLogin(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
