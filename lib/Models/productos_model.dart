class ProductosModel {

  //int id= 0;
  String name = "";
  String price = "";
  String description = "";
  String quantity = "";
  String image = "";


  ProductosModel(this.name,this.price,this.description, this.quantity,this.image);
  ProductosModel.fromJson(Map<String, dynamic> json){

    //id = json['IdProduct'];
    name = json['NombreProd'];
    price = json['Costo'];
    description = json['Descripcion'];
    //quantity = json['Cantidad'];
    image = json['Foto'];

  }
}
