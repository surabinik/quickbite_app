import 'cart_item.dart';

enum OrderStatus {
  placed,
  preparing,
  readyForPickup;

  String get displayName {
    switch (this) {
      case OrderStatus.placed:
        return 'Placed';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.readyForPickup:
        return 'Ready for Pickup';
    }
  }
}

class FoodOrder {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  OrderStatus status;
  final DateTime orderTime;
  final String estimatedPickupTime;
  final String pickupLocation;

  FoodOrder({
    required this.id,
    required this.items,
    required this.totalAmount,
    this.status = OrderStatus.placed,
    required this.orderTime,
    this.estimatedPickupTime = '15 - 20 mins',
    this.pickupLocation = 'Canteen Counter 2',
  });
}
