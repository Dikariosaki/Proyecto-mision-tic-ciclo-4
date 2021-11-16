import 'Package:flutter/material.dart';

class shopRegister extends StatefulWidget{
  @override
  shopRegisterApp createdState() => ShopRegisterApp();
;
}


class ShopRegisterApp extends State<shopRegister>{
  @override
 Widget build(BuildContext context){



   ///////////**********
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Busqueda"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:15,top:15,right:15,bottom:8),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Nombre tienda",
            hintText: "Digite el nombre de la tienda",
            border: OutlineInputBorder(
                borderRadius : BorderRadius.circular(20)
            ),
          ),
        ),
      ),
    );
  }

}
