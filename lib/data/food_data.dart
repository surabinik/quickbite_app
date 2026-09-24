import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodData {
  static const List<String> categories = ['All', 'Meals', 'Beverages', 'Snacks'];

  static final List<FoodItem> foodItems = [
    const FoodItem(
      id: 'f1',
      name: 'Chicken Rice',
      category: 'Meals',
      description: 'Flavorful seasoned rice served with tender roasted chicken, fresh salad, and spicy chili sauce.',
      price: 4.50,
      imageUrl: 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500',
      iconData: Icons.rice_bowl,
      calories: '520 kcal',
    ),
    const FoodItem(
      id: 'f2',
      name: 'Chicken Kottu',
      category: 'Meals',
      description: 'Chopped flatbread stir-fried with juicy chicken, vegetables, egg, and aromatic spices.',
      price: 5.00,
      imageUrl: 'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500',
      iconData: Icons.dinner_dining,
      calories: '610 kcal',
    ),
    const FoodItem(
      id: 'f3',
      name: 'Vegetable Rice',
      category: 'Meals',
      description: 'Healthy steamy fried rice loaded with mixed fresh garden vegetables and mild seasoning.',
      price: 3.50,
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
      iconData: Icons.set_meal,
      calories: '410 kcal',
    ),
    const FoodItem(
      id: 'f4',
      name: 'Veggie Burger',
      category: 'Meals',
      description: 'Grilled crisp vegetable patty layered with fresh lettuce, tomatoes, cheese, and special sauce.',
      price: 4.00,
      imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=500',
      iconData: Icons.lunch_dining,
      calories: '450 kcal',
    ),
    const FoodItem(
      id: 'f5',
      name: 'Iced Coffee',
      category: 'Beverages',
      description: 'Chilled freshly brewed espresso blended with creamy milk and sweetened with vanilla syrup.',
      price: 2.00,
      imageUrl: 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=500',
      iconData: Icons.local_cafe,
      calories: '180 kcal',
    ),
    const FoodItem(
      id: 'f6',
      name: 'Fresh Juice',
      category: 'Beverages',
      description: '100% natural freshly squeezed orange juice served chilled for instant refreshment.',
      price: 2.50,
      imageUrl: 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=500',
      iconData: Icons.local_drink,
      calories: '120 kcal',
    ),
    const FoodItem(
      id: 'f7',
      name: 'French Fries',
      category: 'Snacks',
      description: 'Golden crispy potato fries lightly salted and served hot with ketchup dip.',
      price: 2.50,
      imageUrl: 'https://images.unsplash.com/photo-1576107232684-1279f3908594?w=500',
      iconData: Icons.fastfood,
      calories: '320 kcal',
    ),
    const FoodItem(
      id: 'f8',
      name: 'Club Sandwich',
      category: 'Snacks',
      description: 'Toasted triple-decker sandwich stuffed with chicken, fresh egg, lettuce, and mayo.',
      price: 3.00,
      imageUrl: 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500',
      iconData: Icons.bakery_dining,
      calories: '380 kcal',
    ),
  ];
}
