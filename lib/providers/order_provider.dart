import 'package:flutter/foundation.dart';
import '../models/order.dart';
import '../models/cart_item.dart';

class OrderProvider with ChangeNotifier {
  final List<FoodOrder> _orders = [];
  int _orderCounter = 1024;

  List<FoodOrder> get orders => List.unmodifiable(_orders);

  FoodOrder? get currentOrder => _orders.isNotEmpty ? _orders.first : null;

  FoodOrder createOrder(List<CartItem> items, double total) {
    final String orderId = 'QB$_orderCounter';
    _orderCounter++;

    final newOrder = FoodOrder(
      id: orderId,
      items: items.map((e) => CartItem(foodItem: e.foodItem, quantity: e.quantity)).toList(),
      totalAmount: total,
      status: OrderStatus.placed,
      orderTime: DateTime.now(),
      estimatedPickupTime: '15 - 20 mins',
      pickupLocation: 'Canteen Counter 2',
    );

    _orders.insert(0, newOrder);
    notifyListeners();
    return newOrder;
  }

  void updateOrderStatus(String orderId) {
    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      final current = _orders[index].status;
      if (current == OrderStatus.placed) {
        _orders[index].status = OrderStatus.preparing;
      } else if (current == OrderStatus.preparing) {
        _orders[index].status = OrderStatus.readyForPickup;
      }
      notifyListeners();
    }
  }

  FoodOrder? getOrderById(String orderId) {
    try {
      return _orders.firstWhere((o) => o.id == orderId);
    } catch (_) {
      return null;
    }
  }
}
