import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'buscar.dart';
import 'Shop.dart';
import 'package:proyecto_grupo1/ShopRegister.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart CreateState() => HomeStart();
}

class HomeStart extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "bienvenidos grupo 06",
      home: Scaffold(
        appBar: AppBar(
          title: Text(" Home App grupo 06"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("Image/retail.png"),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "busqueda",
                      hintText: "palabra calve de la busqueda"),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("Presionado");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => buscar()));
                      },
                      child: Text("buscar"))),
              Padding(
                  padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("Presionado");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => shop()));
                      },
                      child: Text("Listado de tiendas"))),
              Padding(
                  padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("Presionado");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => shopRegister()));
                      },
                      child: Text("registrar tiendas")))
            ],
          ),
        ),
      ),
    );
  }
}
