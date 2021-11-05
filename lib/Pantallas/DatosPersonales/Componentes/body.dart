import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/background.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "DATOS PERSONALES",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/iconos/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Nombre",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Apellido Paterno",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Apellido Materno",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Teléfono",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Correo Alternativo",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Dirreción",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Codigo Postal",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Ciudad",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "REGISTRAR",
              press: () {},
            ),
          ],
        ),
      ),
  );
  }
}