import 'package:flutter_native_interaction/models/Category.dart';
import 'package:flutter_native_interaction/models/Comment.dart';
import 'package:flutter_native_interaction/models/Image.dart';
import 'package:flutter_native_interaction/models/Rate.dart';
import 'package:flutter_native_interaction/models/User.dart';

class Product {
  final int id;
  final String name, description;
  final List<String> images;
  final Rate rate;
  final double price;
  final int quantity;
  final User seller;
  final Comment comment;
  final Category category;
  final Category subCategory;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.rate,
      this.quantity,
      this.seller,
      this.category,
      this.subCategory,
      this.images,
      this.comment});

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      description: data['description'],
      rate: Rate.fromJson(data['rating']),
      quantity: data['quantity'],
      seller: User.fromJson(data['seller']),
      category: Category.fromJson(data['category']),
      subCategory: Category.fromJson(data['subCategory']),
      // images: Image.fromJson(data['images']),
      comment: Comment.fromJson(data['comment']),
    );
  }
}
