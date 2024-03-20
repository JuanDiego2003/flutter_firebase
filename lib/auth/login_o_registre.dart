import 'package:flutter/material.dart';
import 'package:flutter_firebase/pagines/pagina_login.dart';
import 'package:flutter_firebase/pagines/pagina_registre.dart';

class LoginORegistre extends StatefulWidget {
  const LoginORegistre({super.key});
  
  @override
  State<LoginORegistre> createState() => _LoginORegistreState();
}

class _LoginORegistreState extends State<LoginORegistre> {
  bool mostraPaginaLogin = true;

  void intercanviaPaginasLoginRegistre() {
    setState(() {
      mostraPaginaLogin = !mostraPaginaLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mostraPaginaLogin) {
      return PaginaLogin(alFenClic: intercanviaPaginasLoginRegistre,);
    } else {
      return PaginaRegistre(alFenClic: intercanviaPaginasLoginRegistre,);
    }
  }
}
