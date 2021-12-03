class ProductosModel {

  String name = "";
  String price = "";
  String quantity = "";
  String image = "";


  ProductosModel(this.name,this.price, this.quantity,this.image);


  ProductosModel.fromJson(Map<String, dynamic> json){

    name = json['NombreProd'];
    price = json['Costo'];
    image = json['Foto'];

  }

  Map<String,dynamic> JsonAddProductos()
  {
    return
        {
          'NombreProd' : name,
          'Costo' : price,
          'Foto' : image,
        };
  }
}

