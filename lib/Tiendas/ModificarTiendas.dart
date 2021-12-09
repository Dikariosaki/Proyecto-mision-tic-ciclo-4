import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ModificarTiendas extends StatefulWidget {
  @override
  ModificarTiendasApp createState() => ModificarTiendasApp();
}

//
class ModificarTiendasApp extends State<ModificarTiendas> {
  TextEditingController nombreTienda = TextEditingController();
  TextEditingController descrip = TextEditingController();
  TextEditingController ruta = TextEditingController();
  TextEditingController webSite = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  String idDoc = "";

  validarDatos() async {
    try {
      CollectionReference ref =
          FirebaseFirestore.instance.collection("Tiendas");
      QuerySnapshot Tiendas = await ref.get();

      if (Tiendas.docs.length != 0) {
        for (var cursor in Tiendas.docs) {
          if (cursor.get("nombreTienda") == nombreTienda.text) {
            nombreTienda.text = cursor.get("nombreTienda");
            ruta.text = cursor.get("ruta");
            descrip.text = cursor.get("descrip");
            webSite.text = cursor.get("WebSite");
            this.idDoc = cursor.id;
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
      await firebase.collection("Tiendas").doc(idDoc).set({
        "nombreTienda": nombreTienda.text,
        "ruta": ruta.text,
        "descrip": descrip.text,
        "WebSite": webSite.text,
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
        title: Text("modificar tienda"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // NOMBRE USUARIO
              child: TextField(
                controller: nombreTienda,
                decoration: InputDecoration(
                  labelText: "nombre de la tienda",
                  hintText: "Digite su nombre de la tienda",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
                child: ElevatedButton(
                  onPressed: () {
                    validarDatos();
                  },
                  child: Text("Buscar Tienda"),
                )),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // NOMBRE TIENDA
              child: TextField(
                controller: nombreTienda,
                decoration: InputDecoration(
                    labelText: "nombre",
                    hintText: "Digite el nombre de su tienda",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // RUTA TIENDA
              child: TextField(
                controller: ruta,
                decoration: InputDecoration(
                    labelText: "ruta",
                    hintText: "Digite la ruta de su imagen",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // DESCRIPCIÓN TIENDA
              child: TextField(
                controller: descrip,
                decoration: InputDecoration(
                    labelText: "descripcion",
                    hintText: "Digite su descripcion",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              // PÁGINA WEB
              child: TextField(
                controller: webSite,
                decoration: InputDecoration(
                    labelText: "WebSite",
                    hintText: "Digite su WebSite",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 0),
              child: ElevatedButton(
                onPressed: () {
                  modificarDatos();
                   nombreTienda.clear();
                   descrip.clear();
                  webSite.clear();
                },
                child: Text("Modificar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
