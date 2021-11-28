import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

insertarDatos(TextEditingController name, TextEditingController app,TextEditingController apm,
    TextEditingController tel, TextEditingController correo,TextEditingController dire,
    TextEditingController cp,TextEditingController ciudad) async
{

  var url = "http://192.168.1.67/Conexion/insertarDatos.php";
  final response = await http.post(Uri.parse(url) ,
      body: {
        "Nombre": name.text,
        "APP": app.text,
        "APM": apm.text,
        "Telefono": tel.text,
        "CorreoAlter": correo.text,
        "Direccion": dire.text,
        "CP": cp.text,
        "Ciudad": ciudad.text
      });

  var data = json.decode(response.body);
  print(data);
}

