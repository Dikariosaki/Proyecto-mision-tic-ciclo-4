import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_grupo1/carrito/ShoppingCart.dart';

import '../main.dart';

class Pagos extends StatefulWidget {
  @override
  PagosApp createState() => PagosApp();
}
//
class PagosApp extends State<Pagos> {
  @override
  TextEditingController nombreCliente =TextEditingController();
  TextEditingController CorreoCliente=TextEditingController();
  TextEditingController DireccionCliente=TextEditingController();
  TextEditingController tarjeta =TextEditingController();
  final firebase=FirebaseFirestore.instance;

  registrarpago() async{
    try{
      await firebase
          .collection("Envios")
          .doc()
          .set({
        "nombreUsuario":nombreCliente.text,
        "correo":CorreoCliente.text,
        "direccion":DireccionCliente.text,
        "Password":tarjeta.text,
      });
    }
    catch (e){
      print(e);
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Realizar pedido"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // NOMBRE USUARIO
                child: TextField(
                  controller: nombreCliente,
                  decoration: InputDecoration(
                    labelText: "Digite su nombre",
                    hintText: "Digite el nombre de a quien sera entregado",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // RUTA IMÁMGEN
                child: TextField(
                  controller: CorreoCliente,
                  decoration: InputDecoration(
                      labelText: "Correo",
                      hintText: "Ingrese su correo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: TextField(
                  controller: DireccionCliente,
                  decoration: InputDecoration(
                      labelText: "Direccion",
                      hintText: "ingrese su Dirección",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                child: TextField(
                  controller: tarjeta,
                  decoration: InputDecoration(
                      labelText: "ingrese su tarjeta",
                      hintText: "Digite su tarjeta NUMERO //DIA//MES//CCV",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text("Total a pagar=" + precioTotal.toString()),
              ),
              Padding(
                  padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                  child: ElevatedButton(
                    onPressed: (){
                      registrarpago();
                      nombreCliente.clear();
                      CorreoCliente.clear();
                      DireccionCliente.clear();
                      tarjeta.clear();
                      mensaje("Pago realizado", "Gracias por su compra");
                    },
                    child: Text("Realizar pago"),
                  )
              ),
            ],
          ),
        )

    );
  }
  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (_) => Home()));
                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              ),
            ],
          );
        });
  }
}