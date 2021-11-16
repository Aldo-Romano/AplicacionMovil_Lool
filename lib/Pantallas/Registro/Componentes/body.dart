import 'package:aplicacion_movil_lool/LogicaNegocios/InsertarRegistro.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Login/pantalla_login.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/background.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/dividir.dart';
import 'package:aplicacion_movil_lool/Componentes/cuenta_existente.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_contraseña.dart';
import 'package:flutter_svg/svg.dart';


class Body extends StatelessWidget {

  TextEditingController name = new TextEditingController();
  TextEditingController correo = new TextEditingController();
  TextEditingController pass = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "REGISTRATE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/iconos/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Nombre de Usuario",
              controller: name,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Correo electrónico",
              controller: correo,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {}, controller: pass,
            ),
            RoundedButton(
              text: "REGISTRARSE",
              press: () {
                    insertar(name,correo,pass);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
          ],
        ),
      ),
    );
  }
}
