import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String msj= "";
String username= "";

Future<String> obtener(TextEditingController user, TextEditingController pass)async {

  var url = "http://192.168.1.69/Conexion/obtenerUsuario.php";
  final response = await http.post(Uri.parse(url), body: {
    "Correo": user.text,
    "Contra": pass.text
  });
  var datauser = json.decode(response .body);

    if(datauser[0]['Rol']=='Usuario')
    {

      (BuildContext context)
      {
        Navigator.pushReplacementNamed(context, '/pantalla_productos');
      };

    }
    else if(datauser[0]['Rol']=='Administrador')
    {
          (BuildContext context)
      {
        Navigator.pushReplacementNamed(context, '/pantalla_productosAdmin');
      };

  }
  return datauser;
}