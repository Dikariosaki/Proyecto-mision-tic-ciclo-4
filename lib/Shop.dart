import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class shop extends  StatefulWidget{
  @override
  ShopApp createState() => ShopApp();

}

class ShopApp extends State <shop>{
  Widget build (BuildContext context) {
    Widget titleSction=Container(
     padding: const EdgeInsets.all(32),
      child: Row(
        children:[
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Comidas rapidas El gordo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Text("Perri calientes. Hamburguesas, Salchipapa, Mazorcadas y todo tipo de comidas rapidas",
              style: TextStyle(
                color: Colors.lightGreenAccent[500],
              )
              )
            ]
          )
        ),
          Container(
            width: 80,
            height: 80,
            child: Image.asset("Image/Hambuguesas.jpg"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Entrar"))
          ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tiendas"),
      ),
      body: ListView(
        children: [
          titleSction
        ],
      )
    );
  }

}