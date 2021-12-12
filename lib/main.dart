import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Tiendas/ShopOne.dart';
import 'buscar.dart';
import 'Tiendas/Shop.dart';
import 'Tiendas/ShopRegister.dart';
import 'Usuarios/GestionUsuario.dart';
import 'Tiendas/GestionTiendas.dart';
import 'carrito/ShoppingCart.dart';
import 'package:proyecto_grupo1/carrito/Carrito.dart';


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
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  TextEditingController busqueda = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "bienvenidos grupo 06",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(title: Text("aplicacion grupo 6-01"), actions: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (_) => ShoppingCart(idUsuariomain)));
            },
            tooltip: 'Carrito de compras',
            child: const Icon(Icons.shopping_cart),
            //child: Text("add"),
            backgroundColor: Colors.indigoAccent,
          )
        ]),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => buscar(busqueda.text)));
                    },
                    child: Text("buscar"),
                  )),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(150, 45)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GestionTiendas()));
                  },
                  child: Text('Gestionar tienda'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    //print("presionado");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GestionUsuario()));
                  },
                  child: Text('Gestión Usuario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
