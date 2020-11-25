import 'Category.dart';

class CategoryResponse {
  final Category categories;

  CategoryResponse({this.categories});

  factory CategoryResponse.fromJson(Map<String, dynamic> data) {
    return CategoryResponse(
      categories: Category.fromJson(data["categories"]),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "categories": Category.toJson(),
  //   };
  // }
}
