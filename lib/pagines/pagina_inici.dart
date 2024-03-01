// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PaginaInici extends StatelessWidget {
  const PaginaInici({super.key});
  void logOut() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Inici"),
        actions: [IconButton(onPressed: logOut, icon: Icon(Icons.logout))],
      ),
    );
  }
}
