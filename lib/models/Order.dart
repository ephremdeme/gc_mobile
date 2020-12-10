class Order {
  Orders orders;
  int pin;
  String sellerPhone;

  Order({this.orders, this.pin, this.sellerPhone});

  Order.fromJson(Map<String, dynamic> json) {
    orders =
        json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    pin = json['pin'];
    sellerPhone = json['sellerPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.toJson();
    }
    data['pin'] = this.pin;
    data['sellerPhone'] = this.sellerPhone;
    return data;
  }
}

class Orders {
  List<Products> products;

  Orders({this.products});

  Orders.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  int quantity;

  Products({this.id, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}