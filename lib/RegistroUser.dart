import 'Package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroUser extends StatefulWidget {
  @override
  RegistroUserApp createState() => RegistroUserApp();
}

class RegistroUserApp extends State<RegistroUser> {
  @override
  TextEditingController nombreUser = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController password = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registrarUsuario() async {
    try {
      await firebase.collection("usuarios").doc().set({
        "NombreUsuario": nombreUser.text,
        "Correo": correo.text,
        "Telefono": telefono.text,
        "Password": password.text
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    ///++++++++++++++++++++++++++++
    return Scaffold(
        appBar: AppBar(
          title: Text("Regisgtro de tiendas"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                // NOMBRE TIENDA
                child: TextField(
                  controller: nombreUser,
                  decoration: InputDecoration(
                    labelText: "Nombre ",
                    hintText: "Digite nombre de usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                // RUTA IMÁMGEN
                child: TextField(
                  controller: correo,
                  decoration: InputDecoration(
                      labelText: "Correo",
                      hintText: "Digite su Correo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                // DESCRIPCIÓN TIENDA
                child: TextField(
                  obscureText: true,
                  controller: telefono,
                  decoration: InputDecoration(
                      labelText: "Telefono",
                      hintText: "Digite su telefono",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                // PÁGINA WEB
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: "contraseña",
                      hintText: "Digite su Contraseña",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                  child: ElevatedButton(
                    onPressed: () {
                      registrarUsuario();
                      nombreUser.clear();
                      correo.clear();
                      telefono.clear();
                      password.clear();
                    },
                    child: Text("Registrar"),
                  )
              ),
            ],
          ),
        ));
  }
}
