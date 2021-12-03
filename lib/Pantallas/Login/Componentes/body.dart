
import 'dart:convert';
import 'package:aplicacion_movil_lool/LogicaNegocios/obtener_usuarios.dart';
import 'package:aplicacion_movil_lool/Pantallas/Productos/pantalla_productos.dart';
import 'package:aplicacion_movil_lool/Pantallas/Productos/pantalla_productosAdmin.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Pantallas/Login/Componentes/background.dart';
import 'package:aplicacion_movil_lool/Pantallas/Registro/pantalla_registro.dart';
import 'package:aplicacion_movil_lool/Componentes/cuenta_existente.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_contraseña.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({
    Key? key,
  }) : super(key: key);
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<Body> {

   TextEditingController user = new TextEditingController();
   TextEditingController pass = new TextEditingController();

   String msg='';

   Future<List> _login() async {

     var url = "http://192.168.1.69/Conexion/obtenerUsuario.php";
     final response = await http.post(Uri.parse(url), body: {
       "Correo": user.text,
       "Contra": pass.text});


     String body = utf8.decode(response.bodyBytes);
     var datauser = jsonDecode(body);

     if(datauser.length==0){
       setState(() {
         msg="Error";
       });
     }else{
       if(datauser[0]['Rol']=='Usuario'){

         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));

       }else if(datauser[0]['Rol']=='Administrador'){
         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreenAdmin()));

       }
       setState(() {
         username= datauser[0]['username'];
       });

     }

     return datauser;
   }


   @override
   void initState()
   {
     super.initState();
     //_login();
   }
   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
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
               controller: user,
               onChanged: (String value) {  },
            ),
            RoundedPasswordField(
             onChanged: (String value) {  },
              controller: pass,
            ),
            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {
                _login();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                     // return SignUpScreen();
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



