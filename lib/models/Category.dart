import 'package:flutter_native_interaction/models/Product.dart';

class Category {
  final int id;
  final String category;
  final List<Product> products;
  final List<Product> subProducts;
  final List<Category> subCategory;

  Category({
    this.id,
    this.category,
    this.products,
    this.subProducts,
    this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      category: data['category'],
      // products: Product.fromJson(data['products']),
      // subProducts: Product.fromJson(data['products']),
      // subCategory: Category.fromJson(data['products']),
    );
  }
}
