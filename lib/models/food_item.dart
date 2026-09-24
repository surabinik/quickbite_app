import 'package:flutter/material.dart';

class FoodItem {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String imageUrl;
  final IconData iconData;
  final String calories;

  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.iconData,
    this.calories = '350 kcal',
  });
}
