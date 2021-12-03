import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplicacion_movil_lool/Models/productos_model.dart';

Future<List<ProductosModel>> MostrarProductos() async
{
  var url = "http://192.168.1.69/Conexion/productos.php";
  var response = await http.post(url).timeout(Duration(seconds: 90));

  var datos = jsonDecode(response.body);
  List<ProductosModel> registros = [];

  for(datos in datos)
  {
    registros.add(ProductosModel.fromJson(datos));
  }

  return registros;

}
