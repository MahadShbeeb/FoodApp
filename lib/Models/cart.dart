import 'package:flutter/material.dart';

class CartItem {
  String id;
  String title;
  int quantity;
  double price;

  CartItem({this.id, this.title, this.price, this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return _items;
    notifyListeners();
  }

  int get itemCount {
    return items.length;
    notifyListeners();
  }

  double get totalprice {
    double count = 0;
    _items.forEach((key, cartitem) {
      count += cartitem.price * cartitem.quantity;
    });
    return count;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (itemofproductid) => CartItem(
          id: itemofproductid.id,
          title: itemofproductid.title,
          price: itemofproductid.price,
          quantity: itemofproductid.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String cartItemId) {
    _items.remove(cartItemId);
    notifyListeners();
  }

  void removeUndoItem(String productId) {
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (product) => CartItem(
            id: product.id,
            title: product.title,
            price: product.price,
            quantity: product.quantity - 1),
      );
    } else {
      _items.remove(productId);
    }
  }

  void clearItems() {
    _items = {};
    notifyListeners();
  }
}
