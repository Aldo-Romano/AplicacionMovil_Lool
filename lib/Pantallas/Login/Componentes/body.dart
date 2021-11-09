import 'package:aplicacion_movil_lool/Pantallas/DatosPersonales/pantalla_datospersonales.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Login/Componentes/background.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/pantalla_registro.dart';
import 'package:aplicacion_movil_lool/Componentes/cuenta_existente.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_contraseña.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "INICIAR SESIÓN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/iconos/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Correo electrónico",
              onChanged: (controlCorreo) {
              },
            ),
            RoundedPasswordField(
              onChanged: (controlContrasenia) {},
            ),
            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PersonalScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
