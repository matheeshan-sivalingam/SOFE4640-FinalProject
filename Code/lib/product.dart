import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? id;
  final String? name;
  final String? brand;
  final int? price;
  final String? desc;

  const Product({
    required this.id,
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