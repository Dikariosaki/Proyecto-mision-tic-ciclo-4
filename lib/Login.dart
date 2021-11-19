import 'dart:html';

import 'Package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'buscar.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  int flag =0;
  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("usuarios");
      QuerySnapshot usuarios = await ref.get();

      if (usuarios.docs.length != 0) {
        print("flag");
        print(usuarios.docs.length);
        int flag =0;
        for (var cursor in usuarios.docs) {
          print(cursor.get("correo"));
          if (cursor.get("correo") == correo.text){
            print(cursor.get("password"));
            if(cursor.get("password") == pass.text){
              mensaje("Correcto","usuario correcto");
              print(cursor.get("NombreUsuario"));
              flag =1;
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => buscar()));
            }
          }
        }
          print(flag);
          if(flag==0){
            mensaje("No encontrado","no se encontro el usuario");
          }
      } else {
        print("No hay elementos en la colección");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ingreso clientes"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset("Image/Login.png"),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                    controller: correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "correo",
                    hintText: "Digite el correo",
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "contraseña",
                    hintText: "Digite su contraseña",
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, top: 30, right: 5, bottom: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () {
                    validarDatos();
                    correo.clear();
                    pass.clear();
                  },
                  child: Text("Enviar"),
                ),
              )
            ],
          ),
        ));
  }


  void mensaje(String titulo, String mess){
    showDialog(
      context: context,
      builder: (builcontext){
        return AlertDialog(
          title: Text(titulo),
          content: Text(mess),
          actions: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.of(context).pop();
            },

            child: Text("Aceptar",
            style: TextStyle(color:Colors.blueGrey)
            ),
            )
          ],
        );
      }
    );
  }
}
