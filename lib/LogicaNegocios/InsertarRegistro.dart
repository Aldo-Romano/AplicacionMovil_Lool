import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

insertar(TextEditingController name, TextEditingController correo,TextEditingController pass) async
{

    var url = "http://192.168.1.64/Conexion/InsertarRegistro.php";
    final response = await http.post(Uri.parse(url) ,
        body: {
          "NombreUsuario": name.text,
          "Correo": correo.text,
          "Contra": pass.text
        });

    var data = json.decode(response.body);
    print(data);
}

