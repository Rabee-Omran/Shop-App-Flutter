import 'package:flutter/material.dart';

class CardItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CardItem> _items = {};

  Map<String, CardItem> get items {
    return {...items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CardItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      _items.putIfAbsent(
        productId,
        () => CardItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
