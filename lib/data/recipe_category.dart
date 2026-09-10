import 'package:flutter/material.dart';

class RecipeCategory {
  final String name;
  final IconData icon;

  const RecipeCategory({required this.name, required this.icon});
}

const List<RecipeCategory> staticCategories = [
  RecipeCategory(name: 'All', icon: Icons.category_rounded),
  RecipeCategory(name: 'Popular', icon: Icons.local_fire_department_rounded),
  RecipeCategory(name: 'Pizza', icon: Icons.local_pizza_rounded),
  RecipeCategory(name: 'Pasta', icon: Icons.ramen_dining_rounded),
  RecipeCategory(name: 'Chicken', icon: Icons.restaurant_rounded),
  RecipeCategory(name: 'Beef', icon: Icons.lunch_dining_rounded),
  RecipeCategory(name: 'Vegetarian', icon: Icons.eco_rounded),
  RecipeCategory(name: 'Salad', icon: Icons.spa_rounded),
  RecipeCategory(name: 'Dessert', icon: Icons.icecream_rounded),
  RecipeCategory(name: 'Drinks', icon: Icons.local_cafe_rounded),
  RecipeCategory(name: 'Soup', icon: Icons.soup_kitchen_rounded),
  RecipeCategory(name: 'Biryani', icon: Icons.rice_bowl_rounded),
  RecipeCategory(name: 'Curry', icon: Icons.ramen_dining_rounded),
  RecipeCategory(name: 'Kebabs', icon: Icons.kebab_dining_rounded),
  RecipeCategory(name: 'Rice', icon: Icons.rice_bowl_rounded),
  RecipeCategory(name: 'Smoothie', icon: Icons.blender_rounded),
  RecipeCategory(name: 'Dosa', icon: Icons.breakfast_dining_rounded),
  RecipeCategory(name: 'Falafel', icon: Icons.fastfood_rounded),
  RecipeCategory(name: 'Ramen', icon: Icons.ramen_dining_rounded),
  RecipeCategory(name: 'Wrap', icon: Icons.wrap_text_rounded),
  RecipeCategory(name: 'Cookies', icon: Icons.cookie_rounded),
  RecipeCategory(name: 'Baking', icon: Icons.bakery_dining_rounded),
];

final List<Map<String, dynamic>> recipes = [
  {
    'name': 'Chicken Curry',
    'category': 'Asian',
    'image': 'https://cdn.dummyjson.com/recipe-images/1.webp',
    'time': 35,
    'rating': 4.8,
  },
  {
    'name': 'Crepes with Orange',
    'category': 'Western',
    'image': 'https://cdn.dummyjson.com/recipe-images/2.webp',
    'time': 35,
    'rating': 4.5,
  },
  {
    'name': 'Chocolate Chip Cookies',
    'category': 'Dessert',
    'image': 'https://cdn.dummyjson.com/recipe-images/3.webp',
    'time': 25,
    'rating': 4.9,
  },
  {
    'name': 'Chicken Alfredo Pasta',
    'category': 'Italian',
    'image': 'https://cdn.dummyjson.com/recipe-images/4.webp',
    'time': 35,
    'rating': 4.9,
  },
];
