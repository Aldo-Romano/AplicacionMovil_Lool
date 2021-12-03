// @dart=2.9
//import 'dart:html';
import 'package:aplicacion_movil_lool/Componentes/boton_redeondeado.dart';
import 'package:aplicacion_movil_lool/Componentes/campo_entrada.dart';
import 'package:aplicacion_movil_lool/LogicaNegocios/crear_productos.dart';
import 'package:aplicacion_movil_lool/Models/productos_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

class CommonThings {
  static Size size;
}

class CrearProductos extends StatefulWidget {
  final String id;
  const CrearProductos({this.id});

  @override
  _CrearProductosState createState() => _CrearProductosState();
}

class _CrearProductosState extends State<CrearProductos> {
  bool _isInAsyncCall = false;
  final _formKey = GlobalKey<FormState>();

   File _image;
   final picker = ImagePicker();
   TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
   
   Future IMG()async{
     var picked = await picker.getImage(source: ImageSource.gallery);
     setState(() {
       _image = File(picked.path);
     });
   }

   Future Crearp()async
   {
     final uri = Uri.parse("http://192.168.1.69/Conexion/CrearProductos.php");
     var request =  http.MultipartRequest('POST',uri);
     request.fields['NombreProd'] = name.text;
     request.fields['Costo'] = price.text;

     var pic = await  http.MultipartFile.fromPath("Foto", _image.path);
     request.files.add(pic);
     var response = await request.send();

     if(response.statusCode == 200)
       {
         print('Bien echo');
         //print(pic);
       }
     else
       {
         print('Error');
       }
   }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Añadir Producto'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _isInAsyncCall,
          opacity: 0.5,
          dismissible: false,
          progressIndicator: CircularProgressIndicator(),
          color: Colors.blueGrey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, right: 15),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.camera),
                      onPressed:(){
                        IMG();
                      }
                    ),
                    Container(
                      child: _image == null ? Text('No se ha seleccionada ninguna imagen'): Image.file(_image)
                    ),
                    RoundedInputField(
                      hintText: "Nombre Producto",
                      controller: name,
                      onChanged: (value) {},
                    ),
                    RoundedInputField(
                      hintText: "Precio",
                      controller: price,
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "Añadir",
                      press: () {
                      Crearp();
                      },
                    ),
                  ]),
              ),
            ),
          ),
        );
  }
}