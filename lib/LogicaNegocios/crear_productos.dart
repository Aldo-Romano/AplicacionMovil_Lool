import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  Future<String> addProducts(TextEditingController Foto, TextEditingController NombreProd,TextEditingController Costo)async
  {
    var url = "http://192.168.1.69/Conexion/CrearProductos.php";
    final response = await http.post(Uri.parse(url) ,
        body: {
          "Foto": Foto.text,
          "NombreProd": NombreProd.text,
          "Costo": Costo.text
        });
    if(response.statusCode == 200)
      {
        print("Agregar: " + response.body);
        return response.body;
      }
    else
      {
        return 'Error';
      }
  }
