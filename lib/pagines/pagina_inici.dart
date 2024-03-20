// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/servei_auth.dart';
import 'package:flutter_firebase/chat/servei_chat.dart';
import 'package:flutter_firebase/components/drawer_aplicacio.dart';
import 'package:flutter_firebase/components/item_usuari.dart';
import 'package:flutter_firebase/pagines/pagina_chat.dart';

class PaginaInici extends StatelessWidget {
  PaginaInici({super.key});

  final _serveiAuth = ServeiAuth();
  final _serveiChat = ServeiChat();
  
  void logOut() {
    _serveiAuth.tancarSessio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Inici"),
        actions: [IconButton(onPressed: logOut, icon: Icon(Icons.logout))],
      ),
      drawer: const DrawerAplicacio(),
      body: _construeixLlistaUsuaris(),
    );
  }
  Widget _construeixLlistaUsuaris() {

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: StreamBuilder(
        stream: _serveiChat.getStreamUsuaris(), 
        builder: (context, snapshot) {
      
          if (snapshot.hasError) {
            return const Text("Error pagina_inici: _construeixLlistaUsuaris");
          }
      
          // Carregar dades.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Carregant dades...");
          }
      
          return ListView(
            children: snapshot.data!.map<Widget>(
              (dadesUsuari) => _construirItemLlista(dadesUsuari, context)).toList(),
          );
      
        },
      ),
    );
  }

  Widget _construirItemLlista(Map<String, dynamic> dadesUsuari, BuildContext context) {

    if (dadesUsuari["email"] != _serveiAuth.getUsuariActual()!.email) {

      return ItemUsuari(
        text: dadesUsuari["email"], 
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => PaginaChat(
                emailDeAmbQuiParlem: dadesUsuari["email"], 
                idDeAmbQuiParlem: dadesUsuari["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
