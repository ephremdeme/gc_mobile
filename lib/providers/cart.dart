import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String image;

  CartItem({
    @required this.id,
    this.image,
    @required this.name,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(int productId, double price, String name, String image) {
    if (_items.containsKey(productId)) {
      //
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              name: existingCartItem.name,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity));
    } else {
      _items.putIfAbsent(
          productId,
          () =>
              CartItem(id: Uuid().v4(), name: name, price: price, quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    print(productId);
    _items.remove(productId);
    notifyListeners();
  }
}
