import 'package:flutter/foundation.dart';
import '../models/food_item.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  List<CartItem> get cartItemList => _items.values.toList();

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  double get subtotal {
    return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(FoodItem foodItem, int quantity) {
    if (_items.containsKey(foodItem.id)) {
      _items[foodItem.id]!.quantity += quantity;
    } else {
      _items[foodItem.id] = CartItem(
        foodItem: foodItem,
        quantity: quantity,
      );
    }
    notifyListeners();
  }

  void updateQuantity(String foodId, int newQuantity) {
    if (!_items.containsKey(foodId)) return;

    if (newQuantity <= 0) {
      _items.remove(foodId);
    } else {
      _items[foodId]!.quantity = newQuantity;
    }
    notifyListeners();
  }

  void removeItem(String foodId) {
    _items.remove(foodId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
