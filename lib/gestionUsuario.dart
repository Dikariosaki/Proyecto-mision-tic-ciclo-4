import 'Package:flutter/material.dart';
import 'RegistroUser.dart';
import 'Login.dart';

class GestionUsuario extends StatefulWidget {
  @override
  GestionUsuarioApp createState() => GestionUsuarioApp();
}

class GestionUsuarioApp extends State<GestionUsuario>{
  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion usuario"),
      ), body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding:
            EdgeInsets.only(top:20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegistroUser()));
              }
              ,
                child: Text("Registro de Usuario"),

            )
          ),
          Padding(
              padding:
              EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: () {}
                  ,
                  child: Text("Cambio de password"),

              )
          ),
          Padding(
              padding:
              EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: () {}
                  ,
                  child: Text("Dar de baja"),

              )
          ),
          Padding(
              padding:
              EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: () {}
                  ,
                  child: Text("Modificar usuario"),

              )
          ),
          Padding(
              padding:
              EdgeInsets.only(top:20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:   (_) => Login()));
                  }
                  ,
                  child: Text("Login"),

              )
          )
        ]
    )
    )
    );
  }

}
