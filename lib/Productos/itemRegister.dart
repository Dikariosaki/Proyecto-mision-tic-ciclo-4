import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class itemRegister extends StatefulWidget {
  final String idTienda;
  itemRegister(this.idTienda);
  @override
  itemRegisterApp createState() => itemRegisterApp();
}
//
class itemRegisterApp extends State<itemRegister> {
  @override
  TextEditingController nombre =TextEditingController();
  TextEditingController precio=TextEditingController();
  TextEditingController descrip=TextEditingController();

  final firebase=FirebaseFirestore.instance;

  registraProducto() async{
    try{
      await firebase
          .collection("Productos")
          .doc()
          .set({
        "Nombre":nombre.text,
        "Precio":double.parse(precio.text),
        "Descripcion":descrip.text,
        "TiendaId": widget.idTienda,
        "Estado":true
      });
    }
    catch (e){
      print(e);
    }
  }

  Widget build(BuildContext context) {

    ///++++++++++++++++++++++++++++
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro del producto"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // NOMBRE USUARIO
                child: TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                    labelText: "Nombre producto",
                    hintText: "Digite nombre del producto",
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
                  controller: precio,
                  decoration: InputDecoration(
                      labelText: "precio final",
                      hintText: "Digite precio",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                // DESCRIPCIÓN TIENDA
                child: TextField(
                  controller: descrip,
                  decoration: InputDecoration(
                      labelText: "descripcion",
                      hintText: "Digite descripción",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left:15,top: 15,right: 15,bottom: 0),
                  child: ElevatedButton(
                    onPressed: (){
                      registraProducto();
                      nombre.clear();
                      precio.clear();
                      descrip.clear();

                    },
                    child: Text("Registrar producto"),
                  )
              ),
            ],
          ),
        )

    );
  }
}