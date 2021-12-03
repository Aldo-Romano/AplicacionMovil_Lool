// @dart=2.9
import 'package:aplicacion_movil_lool/Pantallas/DatosPersonales/pantalla_datospersonales.dart';
import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Models/productos_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cart extends StatefulWidget {
  final List<ProductosModel> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}


class _CartState extends State<Cart> {

  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;


  List<ProductosModel> _cart;
  int q =1;

  Container pagoTotal(List<ProductosModel> _cart) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Text("Total:  \$${valorTotal(_cart)}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black))
        ],
      ),
    );
  }

  String valorTotal(_cart) {
    double total = 0.0;
    for (int i = 0; i < _cart.length; i++) {
      //total = total + _cart[i].price * _cart[i].quantity;
     total = total + int.parse(_cart[i].price) * q;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.store),
            onPressed: null,
            color: Colors.white,
          )
        ],
        title: Text('Detalle',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_enabled && _firstScroll) {
              _scrollController
                  .jumpTo(_scrollController.position.pixels - details.delta.dy);
            }
          },
          onVerticalDragEnd: (_) {
            if (_enabled) _firstScroll = false;
          },
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      final String imagen = _cart[index].image;
                      var item = _cart[index];
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: new Image.asset(
                                          "assets/imagenes/$imagen",
                                          fit: BoxFit.contain),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(item.name,
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.black)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 120,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.red[600],
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 6.0,
                                                      color: Colors.blue[400],
                                                      offset: Offset(0.0, 1.0),
                                                    )
                                                  ],
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0),
                                                  )),
                                              margin: EdgeInsets.only(top: 20.0),
                                              padding: EdgeInsets.all(2.0),
                                              child: new Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.remove),
                                                    onPressed: () {
                                                      setState(() {
                                                        q--;
                                                        //_cart[index].quantity--;
                                                        valorTotal(_cart);
                                                      });
                                                    },
                                                    color: Colors.yellow,
                                                  ),
                                                  Text(q.toString(),
                                                      style: new TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: 22.0,
                                                          color: Colors.white)),
                                                  IconButton(
                                                    icon: Icon(Icons.add),
                                                    onPressed: () {
                                                      setState(() {
                                                        q++;
                                                        //_cart[index].quantity++;
                                                        valorTotal(_cart);
                                                      });
                                                    },
                                                    color: Colors.yellow,
                                                  ),
                                                  SizedBox(
                                                    height: 8.0,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 38.0,
                                    ),
                                    Text(item.price.toString(),
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.0,
                                            color: Colors.black))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.purple,
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  pagoTotal(_cart),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    padding: EdgeInsets.only(top: 50),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text("PAGAR"),
                      onPressed: () => {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => FancyDialog(
                              title: "Aceptar compra",
                              descreption: "Enviar por WhatsApp",
                              animationType: FancyAnimation.BOTTOM_TOP,
                              theme: FancyTheme.FANCY,
                              gifPath: './assets/imagenes/comprar.gif',
                              okFun: () => {
                                msgListaPedido(),
                              },
                            ))
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  void msgListaPedido() async {
    String pedido = "";
    String fecha = DateTime.now().toString();
    pedido = pedido + "FECHA:" + fecha.toString();
    pedido = pedido + "\n";
    pedido = pedido + "MEGA DESCUENTOS A DOMICILIO";
    pedido = pedido + "\n";
    pedido = pedido + "CLIENTE: FLUTTER - DART";
    pedido = pedido + "\n";
    pedido = pedido + "_____________";

    for (int i = 0; i < _cart.length; i++) {
      pedido = '$pedido' +
          "\n" +
          "Producto : " +
          _cart[i].name +
          "\n" +
          "Cantidad: " +
          //q.toString() +
          _cart[i].quantity.toString() +
          "\n" +
          "Precio : " +
          _cart[i].price.toString() +
          "\n" +
          "\_________________________\n";
    }
    pedido = pedido + "TOTAL:" + valorTotal(_cart);

    await launch("https://wa.me/${522229075877}?text=$pedido");

    await launch("https://wa.me/${522228353898}?text=$pedido");

  }
}