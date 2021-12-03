// @dart=2.9
import 'package:aplicacion_movil_lool/LogicaNegocios/mostrar_productos.dart';
import 'package:aplicacion_movil_lool/Pantallas/DatosPersonales/pantalla_datospersonales.dart';
import 'package:aplicacion_movil_lool/Pantallas/Pedidos/crear_productos.dart';
import 'package:aplicacion_movil_lool/Pantallas/Productos/pantalla_productos.dart';
import 'package:aplicacion_movil_lool/Pantallas/Productos/pantalla_productosAdmin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Models/productos_model.dart';
import 'package:aplicacion_movil_lool/Pantallas/Pedidos/otra_pagina.dart';
import 'package:aplicacion_movil_lool/Pantallas/Pedidos/pedidos_lista.dart';


class BodyProductosAdmin extends StatefulWidget {
  BodyProductosAdmin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BodyProductosAdminPageState createState() => _BodyProductosAdminPageState();
}

class _BodyProductosAdminPageState extends State<BodyProductosAdmin> {

  List<ProductosModel> _productosModel = [];

  List<ProductosModel> _listaCarro = [];


  @override
  void initState() {
    super.initState();
    MostrarProductos().then((value)
    {
      setState(() {
        _productosModel.addAll(value);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 38,
                    ),
                    if (_listaCarro.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _listaCarro.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.0),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  if (_listaCarro.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(_listaCarro),
                      ),
                    );
                },
              ),
            )
          ],
        ),
        drawer: Container(
          width: 170.0,
          child: Drawer(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.5,
              color: Colors.black,
              child: new ListView(
                padding: EdgeInsets.only(top: 30.0),
                children: <Widget>[
                  Container(
                    height: 120,
                    child: new UserAccountsDrawerHeader(
                      accountName: new Text(''),
                      accountEmail: new Text(''),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/imagenes/icono1.png'),
                        ),
                      ),
                    ),
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text(
                      'Inicio',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: new Icon(
                      Icons.home,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => ProductScreenAdmin(),
                        )),
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text(
                      'Datos Personales',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: new Icon(
                      Icons.book,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => PersonalScreen(),
                        )),
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text(
                      'Produtos',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: new Icon(
                      Icons.fastfood,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => CrearProductos(),
                        )),
                  ),
                  new Divider(),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.only(left: 24, top: 48),
                          height: 150,
                          child: ListView.builder(
                            itemCount: _productosModel.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: <Widget>[
                                  Container(
                                    height: 300,
                                    padding: new EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    child: Card(
                                      elevation: 7.0,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              24)),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                            "assets/imagenes/" +
                                                '${_productosModel[index].image}',
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(height: 3.0, color: Colors.grey),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        color: Colors.grey[300],
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 1.5,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(4.0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemCount: _productosModel.length,
                          itemBuilder: (context, index) {
                            final String imagen = _productosModel[index].image;
                            var item = _productosModel[index];
                            return Card(
                                elevation: 4.0,
                                child: Stack(
                                  fit: StackFit.loose,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Image.asset(
                                              "assets/imagenes/" +
                                                  '${_productosModel[index].image}',
                                              fit: BoxFit.contain),
                                        ),
                                        Text(
                                          '${_productosModel[index].name}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              '${_productosModel[index].price
                                                  .toString()}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23.0,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8.0,
                                                bottom: 8.0,
                                              ),
                                              child: Align(
                                                alignment: Alignment
                                                    .bottomRight,
                                                child: GestureDetector(
                                                  child:
                                                  (!_listaCarro.contains(item))
                                                      ? Icon(
                                                    Icons.shopping_cart,
                                                    color: Colors.green,
                                                    size: 38,
                                                  )
                                                      : Icon(
                                                    Icons.shopping_cart,
                                                    color: Colors.red,
                                                    size: 38,
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      if (!_listaCarro
                                                          .contains(item))
                                                        _listaCarro.add(item);
                                                      else
                                                        _listaCarro.remove(
                                                            item);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          },
                        )),
                  ],
                ),
              )),
        ));
  }
}
