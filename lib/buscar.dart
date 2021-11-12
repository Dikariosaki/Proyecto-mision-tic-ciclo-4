import 'Package:flutter/material.dart';

class buscar extends StatefulWidget{
  @override
  buscarApp createdState() => buscarApp();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


class buscarApp extends State<buscar>{

  @override
 Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Busqueda"),
      ),
    );
  }

}
