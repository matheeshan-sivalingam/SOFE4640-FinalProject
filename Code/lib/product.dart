import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String? name;
  String? brand;
  int? price;
  String? desc;

  Product({
    this.id = '',
    required this.name,
    required this.brand,
    required this.price,
    required this.desc,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'Name': name,
    'Brand':brand,
    'Price':price,
    'Description':desc,
  };

  static Product fromJSON(Map<String, dynamic> json) => Product(
      id: json['id'],
      name: json['Name'],
      brand: json['Brand'],
      price: json['Price'],
      desc: json['Description']
  );
}