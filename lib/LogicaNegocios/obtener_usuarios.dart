import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Pantallas/Login/pantalla_login.dart';
import 'package:aplicacion_movil_lool/Pantallas/Productos/pantalla_productos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

obtener(TextEditingController user, TextEditingController pass) async {

    var url = "http://192.168.1.79/Conexion/obtenerUsuario.php";
    final response = await http.post(Uri.parse(url), body: {
      "Correo": user.text,
      "Contra": pass.text
    });

    if(response.body == "CORRECTO") {

    }
    else if(response.body == "ERROR")
      {

      }

  }

