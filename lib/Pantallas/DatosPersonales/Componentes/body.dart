import 'package:aplicacion_movil_lool/Pantallas/Productos/pantalla_productos.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/background.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  TextEditingController name = new TextEditingController();
  TextEditingController app = new TextEditingController();
  TextEditingController apm = new TextEditingController();
  TextEditingController tel = new TextEditingController();
  TextEditingController correo = new TextEditingController();
  TextEditingController direc = new TextEditingController();
  TextEditingController cp = new TextEditingController();
  TextEditingController ciudad = new TextEditingController();

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
              onChanged: (value) {}, controller: name,
            ),
            RoundedInputField(
              hintText: "Apellido Paterno",
              onChanged: (value) {}, controller: app,
            ),
            RoundedInputField(
              hintText: "Apellido Materno",
              onChanged: (value) {}, controller: apm,
            ),
            RoundedInputField(
              hintText: "Teléfono",
              onChanged: (value) {}, controller: tel,
            ),
            RoundedInputField(
              hintText: "Correo Alternativo",
              onChanged: (value) {}, controller: correo,
            ),
            RoundedInputField(
              hintText: "Dirreción",
              onChanged: (value) {}, controller: direc,
            ),
            RoundedInputField(
              hintText: "Codigo Postal",
              onChanged: (value) {}, controller: cp,
            ),
            RoundedInputField(
              hintText: "Ciudad",
              onChanged: (value) {}, controller: ciudad,
            ),
            RoundedButton(
              text: "REGISTRAR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
  );
  }
}
