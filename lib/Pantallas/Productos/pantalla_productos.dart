
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Productos/Componentes/body.dart';

class ProductScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BodyProductos(title: 'LOOL'),
    );
  }
}

