class ProductsModel {
  int? status;
  String? message;
  List<Product> products = [];

  ProductsModel({this.status, this.message, required this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
  }
}

class Product {
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  Product({
    this.id,
    this.company,
    this.name,
    this.type,
    this.price,
    this.image,
    this.description,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }
}
