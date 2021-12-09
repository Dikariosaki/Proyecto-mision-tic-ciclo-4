import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BajaUsuario extends StatefulWidget {
  @override
  BajaUsuarioApp createState() => BajaUsuarioApp();
}

class BajaUsuarioApp extends State<BajaUsuario> {
  @override
  TextEditingController correo = TextEditingController();
  String nombre = "";
  String telefono = "";
  String direccion = "";
  final firebase = FirebaseFirestore.instance;
  String correo1 = "";
  String idDoc = "";
  String pass = "";
  bool estado = false;

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Usuarios");
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get("Correo") == correo.text) {
            nombre = cursor.get("nombreUsuario");
            telefono = cursor.get("Telefono");
            direccion = cursor.get("Direccion");
            this.idDoc = cursor.id;
            this.correo1 = cursor.get("Correo");
            this.pass = cursor.get("Password");
            this.direccion = cursor.get("Dirección");
          }
        }
      } else {
        print("No hay elementos en la colección ");
      }
    } catch (e) {
      print(e);
    }
  }

  modificarDatos() async {
    try {
      await firebase.collection("Usuarios").doc(idDoc).set({
        "nombreUsuario": nombre,
        "Correo": this.correo1,
        "Telefono": telefono,
        "Direccion": direccion,
        "Password": pass,
        "Estado": estado
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    ///++++++++++++++++++++++++++++
    return Scaffold(
      appBar: AppBar(
        title: Text("dar baja Usuario"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
             children: const [
               Text("inserta el correo del usuario que deseas dar de baja")
             ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // NOMBRE USUARIO
              child: TextField(
                controller: correo,
                decoration: InputDecoration(
                  labelText: "Correo",
                  hintText: "Digite correo",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  //print("presionado");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => modificarDatos()));
                },
                child: Text('Dar de baja'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
