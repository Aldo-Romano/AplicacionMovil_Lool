import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Login/pantalla_login.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/background.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/dividir.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/Componentes/icono_social.dart';
import 'package:aplicacion_movil_lool/Componentes/cuenta_existente.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_contraseña.dart';
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
              "REGISTRATE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/iconos/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Correo electrónico",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "REGISTRARSE",
              press: () {},
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
