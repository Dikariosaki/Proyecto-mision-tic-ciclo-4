import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopInterface extends StatefulWidget {
  @override
  ShopInterfaceApp createState() => ShopInterfaceApp();
}

class ShopInterfaceApp extends State<ShopInterface> {

  Widget build (BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comidas rapidas el gordo"),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
          Padding(
          padding:
          EdgeInsets.only(left: 50, top: 20, right: 20, bottom: 0),
          child: Center(
            child: Container(
              width: 500,
              height: 500,
              child: Image.asset("Image/Hamburguesas.jpg"),
            ),
          ),
        ),
              ]
    )
    )
    );
  }
  Widget build2 (BuildContext context) {
      Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Comidas Rápidas El Gordo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Perri calientes. Hamburguesas, Salchipapa, Mazorcadas y todo tipo de comidas rapidas",
                    style: TextStyle(
                      color: Colors.green[500],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
      return Scaffold(
        appBar: AppBar(
          title: Text('Comidas Rápidas El Gordo'),
        ),

      );
    }
}
