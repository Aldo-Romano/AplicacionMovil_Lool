import 'dart:convert';
import 'package:aplicacion_movil_lool/Pantallas/DatosPersonales/pantalla_datospersonales.dart';
import 'package:aplicacion_movil_lool/Pantallas/Login/pantalla_login.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/pantalla_registro.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;



  String msj = "";
  Future<List> obtener(TextEditingController user, TextEditingController pass) async {
    var url = "http://192.168.1.64/Conexion/obtenerUsuario.php";
    final response = await http.post(Uri.parse(url), body: {
      "Correo": user.text,
      "Contrasenia": pass.text
    });
    var  datauser = json.decode(response.body);
    if(datauser.length == 0)
    {

      SignUpScreen();
      msj = "Incorrecto";
    }
    else if(datauser.length != 0)
    {
      PersonalScreen();
      msj = "Correcto";
    }
    return datauser;

  }

