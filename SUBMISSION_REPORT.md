# QuickBite – Campus Food Ordering App
## University Activity Submission Report

---

## 1. Introduction
QuickBite is a mobile application prototype designed for university campus canteens. It enables students and staff to browse daily food menus, select items, customize quantities, place pre-orders, and track their order status in real time to reduce queue waiting times between lectures.

---

## 2. Application Overview
The application is built as a cross-platform Flutter application using Dart. It provides a full food-ordering user journey from splash screen to live order status simulation, profile management, and order history tracking.

---

## 3. Functional Requirements Implemented
- **Splash Screen**: QuickBite branding with automatic 3-second navigation to Login/Guest.
- **Login / Guest Access**: Dual option for simulated student login or instant guest browsing.
- **Home Screen**: Scrollable menu grid, search bar filtering, and category chips (Meals, Beverages, Snacks).
- **Item Detail Screen**: High-resolution image banner, description, price, calories, quantity selector (min 1), and Add-to-Cart functionality with feedback.
- **Cart Screen**: Itemized cart list, unit price, quantity controls, dynamic subtotal, item count badge, and empty state screen.
- **Checkout Screen**: Order summary review, campus canteen pickup location info, and place order action.
- **Order Confirmation Screen**: Order ID generation (`QB1024` format), estimated pickup time, order total, and navigation buttons.
- **Order Tracking Screen**: Live status progress indicator (`Placed` → `Preparing` → `Ready for Pickup`) with a simulation advance button.
- **Profile Screen**: Generic student or guest profile details, order history log, and logout option.
- **Responsive Layout**: Overflow-safe UI using `LayoutBuilder`, `MediaQuery`, `Expanded`, `Flexible`, and grid builders.

---

## 4. Screens Implemented
1. `SplashScreen` (`lib/screens/splash_screen.dart`)
2. `LoginScreen` (`lib/screens/login_screen.dart`)
3. `HomeScreen` (`lib/screens/home_screen.dart`)
4. `ItemDetailScreen` (`lib/screens/item_detail_screen.dart`)
5. `CartScreen` (`lib/screens/cart_screen.dart`)
6. `CheckoutScreen` (`lib/screens/checkout_screen.dart`)
7. `OrderConfirmationScreen` (`lib/screens/order_confirmation_screen.dart`)
8. `OrderTrackingScreen` (`lib/screens/order_tracking_screen.dart`)
9. `ProfileScreen` (`lib/screens/profile_screen.dart`)

---

## 5. Technology Stack
- **Framework**: Flutter (Dart SDK ^3.13.3)
- **State Management**: `Provider` package (`ChangeNotifier`)
- **UI Design**: Material 3 Design System with `Colors.deepOrange` theme palette
- **Target Platforms**: Android & iOS (Cross-platform Flutter codebase)

---

## 6. Project Structure
```text
quickbite_app/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── food_item.dart
│   │   ├── cart_item.dart
│   │   └── order.dart
│   ├── data/
│   │   └── food_data.dart
│   ├── providers/
│   │   ├── cart_provider.dart
│   │   ├── order_provider.dart
│   │   └── user_provider.dart
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── item_detail_screen.dart
│   │   ├── cart_screen.dart
│   │   ├── checkout_screen.dart
│   │   ├── order_confirmation_screen.dart
│   │   ├── order_tracking_screen.dart
│   │   └── profile_screen.dart
│   └── widgets/
│       ├── food_card.dart
│       └── quantity_selector.dart
├── test/
│   └── widget_test.dart
├── TEST_PLAN.md
├── SUBMISSION_REPORT.md
└── pubspec.yaml
```

---

## 7. Key Implementation Details
- **Local Data Model**: Preloaded menu items in `lib/data/food_data.dart` representing campus meals, snacks, and beverages.
- **Image Fallback System**: `FoodCard` and `ItemDetailScreen` utilize `Image.network` with built-in `errorBuilder` fallback icons to prevent broken UI when offline.
- **Search & Category Filtering**: `HomeScreen` dynamically filters food items matching search keywords and active category chips.

---

## 8. Key Code Snippets and Explanations

### 8.1 Navigation

```dart
// lib/main.dart (MaterialApp Navigation Route Definition)
MaterialApp(
  title: 'QuickBite - Campus Food Ordering',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF5722),
      primary: const Color(0xFFFF5722),
    ),
  ),
  home: const SplashScreen(),
  routes: {
    '/splash': (context) => const SplashScreen(),
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/item-detail': (context) => const ItemDetailScreen(),
    '/cart': (context) => const CartScreen(),
    '/checkout': (context) => const CheckoutScreen(),
    '/order-confirmation': (context) => const OrderConfirmationScreen(),
    '/order-tracking': (context) => const OrderTrackingScreen(),
    '/profile': (context) => const ProfileScreen(),
  },
)
```

**Explanation:**  
This code initializes the Flutter application and defines the initial application screen. Navigation is then used to move between the Splash, Login, Home, Item Detail, Cart, Checkout, Order Confirmation, Order Tracking and Profile screens.

---

### 8.2 Cart State Management

```dart
// lib/providers/cart_provider.dart (Adding and Updating Cart Items)
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

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
}
```

**Explanation:**  
CartProvider extends ChangeNotifier and maintains the selected cart items. When an item is added, removed, or its quantity is changed, the provider updates the state and notifies the relevant widgets so that the cart interface and totals are refreshed.

---

### 8.3 Subtotal Calculation

```dart
// lib/providers/cart_provider.dart (Dynamic Subtotal and Item Count Getters)
double get subtotal {
  return _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
}

int get itemCount {
  return _items.values.fold(0, (sum, item) => sum + item.quantity);
}
```

**Explanation:**  
The subtotal is calculated dynamically by multiplying the price of each item by its quantity and adding the results. Therefore, changing the quantity automatically updates the displayed subtotal.

---

### 8.4 Order Status

```dart
// lib/models/order.dart & lib/providers/order_provider.dart (Order Status Lifecycle)
enum OrderStatus {
  placed,
  preparing,
  readyForPickup;

  String get displayName {
    switch (this) {
      case OrderStatus.placed: return 'Placed';
      case OrderStatus.preparing: return 'Preparing';
      case OrderStatus.readyForPickup: return 'Ready for Pickup';
    }
  }
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
```

**Explanation:**  
The order status is represented using predefined states. When the user advances the simulated order, the status changes from Placed to Preparing and then to Ready for Pickup. The interface updates to reflect the current status.

---

## 9. Testing
Comprehensive manual test plan with 9 test cases is detailed in `TEST_PLAN.md`. Smoke tests are configured in `test/widget_test.dart`.

---

## 10. Screenshots / Evidence

[Insert Screenshot – Splash Screen]

[Insert Screenshot – Login Screen]

[Insert Screenshot – Home Screen]

[Insert Screenshot – Item Detail]

[Insert Screenshot – Cart]

[Insert Screenshot – Checkout]

[Insert Screenshot – Order Confirmation]

[Insert Screenshot – Order Tracking]

[Insert Screenshot – Profile]

[Insert Screenshot – Test Evidence]

---

## 11. GitHub Repository Link
https://github.com/surabinik/quickbite_app.git
