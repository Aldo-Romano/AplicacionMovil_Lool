import 'package:flutter/material.dart';
import 'package:aplicacion_movil_lool/Componentes/boton_dar.dart';

class BodyDetails extends StatelessWidget {
  final  imagen;
  final  precio;
  final  nombre;

  BodyDetails({this.imagen, this.precio, this.nombre});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('LOOL',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
          children: [
            const SizedBox(height: 15.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  'Productos',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            const SizedBox(height: 15.0),
            Hero(
                tag: imagen,
                child: Image.asset(imagen,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(precio,
                  style: const TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(nombre,
                  style: const TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50.0,
                child: const Text('Información del producto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: const Color(0xFFF17532)
                    ),
                    child: const Center(
                        child: Text('Agregar al carrito',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )
                    )
                )
            )
          ]
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.add_shopping_cart_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}

