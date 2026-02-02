import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String image;
  final String price;
  final String oriPrice;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.oriPrice,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      oriPrice: map['ori_price'] ?? '',
    );
  }
}

class Cart extends ChangeNotifier {
  static final Cart _instance = Cart._internal();
  factory Cart() => _instance;
  Cart._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);
  
  int get itemCount => _items.length;

  void addItem(Map<String, dynamic> book) {
    _items.add(CartItem.fromMap(book));
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
