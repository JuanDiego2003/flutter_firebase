import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/missatge.dart';

class ServeiChat {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Retornar llista d'usuaris.
  Stream<List<Map<String, dynamic>>> getStreamUsuaris() {
    return _firestore.collection("Usuaris").snapshots().map((event) {
      return event.docs.map((document) {
        final usuari = document.data();

        return usuari;
      }).toList();
    });
  }

  Future<void> enviarMissatge(String idReceptor, missatge) async{
    final String idUsuariActual = _auth.currentUser!.uid;
    final String emailUsuariActual = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Missatge nouMissatge = Missatge(
        idAutor: idUsuariActual,
        emailAutor: emailUsuariActual,
        idReceptor: idReceptor,
        missatge: missatge,
        timestamp: timestamp);
    //Construim l'id de la sala de chat d'aquest missatge
    List<String> idUsuaris = [
      idUsuariActual,
      idReceptor
      ];
      idUsuaris.sort();
      String idSalaChat = idUsuaris.join("-");
      await _firestore
        .collection("SalesChat")
        .doc(idSalaChat)
          .collection("Missatges").add(nouMissatge.retornaMapaMissatge());
  }
}
