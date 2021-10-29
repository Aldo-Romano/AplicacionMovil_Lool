// @dart=2.9
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Bienvenido/pantalla_bienvenida.dart';
import 'package:aplicacion_movil_lool/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lool',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
