import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_recipe_tags.dart';
import '../providers/recipe_providers.dart';
import '../states/recipe_list_state.dart';
import '../../data/recipe_category.dart';
import '../../domain/usecases/get_recipes.dart';
import '../../domain/usecases/get_recipes_by_tag.dart';

final recipeListViewModelProvider =
    NotifierProvider<RecipeListViewModel, RecipeListState>(
      RecipeListViewModel.new,
    );

class RecipeListViewModel extends Notifier<RecipeListState> {
  late final GetRecipeTags _getRecipeTags;
  late final GetRecipes _getRecipes;
  late final GetRecipesByTag _getRecipesByTag;

  @override
  RecipeListState build() {
    _getRecipeTags = ref.watch(getRecipeTagsProvider);
    _getRecipes = ref.watch(getRecipesProvider);
    _getRecipesByTag = ref.watch(getRecipesByTagProvider);

    return const RecipeListState();
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(isInitialLoading: true);

    try {
      final tags = await _getRecipeTags();
      final response = await _getRecipes();

      final categories = [
        const RecipeCategory(name: 'All', icon: Icons.category_rounded),
        ...tags.map(
          (tag) => RecipeCategory(name: tag, icon: _getCategoryIcon(tag)),
        ),
      ];

      state = state.copyWith(
        isInitialLoading: false,
        categories: categories,
        recipes: response.recipes,
      );
    } catch (e) {
      state = state.copyWith(
        isInitialLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadCategories() async {
    state = state.copyWith(isInitialLoading: true);

    try {
      final tags = await _getRecipeTags();

      final categories = [
        const RecipeCategory(name: 'All', icon: Icons.category_rounded),
        ...tags.map(
          (tag) => RecipeCategory(name: tag, icon: _getCategoryIcon(tag)),
        ),
      ];

      state = state.copyWith(isInitialLoading: false, categories: categories);
    } catch (e) {
      state = state.copyWith(
        isInitialLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadRecipes() async {
    state = state.copyWith(selectedCategory: 'All');

    try {
      final response = await _getRecipes();

      state = state.copyWith(recipes: response.recipes);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> loadRecipesByTag(String tag) async {
    state = state.copyWith(selectedCategory: tag);

    try {
      final response = await _getRecipesByTag(tag);

      state = state.copyWith(recipes: response.recipes);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'pizza':
      case 'margherita pizza':
        return Icons.local_pizza_rounded;

      case 'italian':
        return Icons.restaurant_rounded;

      case 'vegetarian':
      case 'salad':
      case 'quinoa salad':
      case 'chickpea salad':
      case 'couscous salad':
        return Icons.eco_rounded;

      case 'stir-fry':
      case 'shrimp stir-fry':
      case 'spring rolls':
      case 'asian':
        return Icons.ramen_dining_rounded;

      case 'cookies':
        return Icons.cookie_rounded;

      case 'dessert':
      case 'matcha ice cream':
        return Icons.icecream_rounded;

      case 'baking':
        return Icons.bakery_dining_rounded;

      case 'pasta':
      case 'pesto pasta':
        return Icons.ramen_dining_rounded;

      case 'chicken':
      case 'teriyaki chicken':
      case 'butter chicken':
      case 'chicken skewers':
        return Icons.restaurant_rounded;

      case 'salsa':
      case 'mango salsa':
        return Icons.spa_rounded;

      case 'quinoa':
        return Icons.grain_rounded;

      case 'bruschetta':
        return Icons.breakfast_dining_rounded;

      case 'beef':
      case 'keema':
        return Icons.lunch_dining_rounded;

      case 'caprese':
        return Icons.local_dining_rounded;

      case 'shrimp':
      case 'shrimp curry':
        return Icons.set_meal_rounded;

      case 'biryani':
      case 'rice':
        return Icons.rice_bowl_rounded;

      case 'main course':
        return Icons.dinner_dining_rounded;

      case 'indian':
      case 'pakistani':
        return Icons.restaurant_rounded;

      case 'karahi':
      case 'curry':
      case 'thai':
        return Icons.soup_kitchen_rounded;

      case 'potatoes':
        return Icons.fastfood_rounded;

      case 'kebabs':
      case 'grilling':
      case 'chickpea':
        return Icons.kebab_dining_rounded;

      case 'saag':
        return Icons.eco_rounded;

      case 'roti':
      case 'wrap':
        return Icons.breakfast_dining_rounded;

      case 'ramen':
      case 'japanese':
        return Icons.ramen_dining_rounded;

      case 'soup':
      case 'borscht':
        return Icons.soup_kitchen_rounded;

      case 'tagine':
      case 'moroccan':
        return Icons.ramen_dining_rounded;

      case 'bibimbap':
      case 'korean':
        return Icons.rice_bowl_rounded;

      case 'moussaka':
      case 'greek':
        return Icons.restaurant_menu_rounded;

      case 'lassi':
      case 'mango':
        return Icons.local_drink_rounded;

      case 'tiramisu':
        return Icons.cake_rounded;

      case 'turkish':
        return Icons.restaurant_menu_rounded;

      case 'smoothie':
      case 'blueberry':
      case 'banana':
      case 'pineapple':
      case 'coconut':
        return Icons.blender_rounded;

      case 'elote':
      case 'mexican':
        return Icons.fastfood_rounded;

      case 'street food':
        return Icons.takeout_dining_rounded;

      case 'russian':
        return Icons.restaurant_menu_rounded;

      case 'dosa':
        return Icons.breakfast_dining_rounded;

      case 'falafel':
      case 'lebanese':
        return Icons.fastfood_rounded;

      case 'caipirinha':
      case 'mojito':
      case 'cuban':
      case 'cocktail':
        return Icons.local_bar_rounded;

      case 'brazilian':
        return Icons.public_rounded;

      case 'spanish':
        return Icons.restaurant_menu_rounded;

      case 'quick':
        return Icons.flash_on_rounded;

      case 'hawaiian':
        return Icons.beach_access_rounded;

      case 'sushi rolls':
        return Icons.set_meal_rounded;

      default:
        return Icons.category_rounded;
    }
  }
}
