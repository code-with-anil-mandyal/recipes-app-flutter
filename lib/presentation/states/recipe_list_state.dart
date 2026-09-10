import 'package:recipes_app/data/recipe_category.dart';

import '../../data/models/recipe_model.dart';

class RecipeListState {
  final bool isInitialLoading;
  final List<RecipeCategory> categories;
  final List<RecipeModel> recipes;
  final String selectedCategory;
  final String? errorMessage;

  const RecipeListState({
    this.isInitialLoading = true,
    this.categories = const [],
    this.recipes = const [],
    this.selectedCategory = 'All',
    this.errorMessage,
  });

  RecipeListState copyWith({
    bool? isInitialLoading,
    List<RecipeCategory>? categories,
    List<RecipeModel>? recipes,
    String? selectedCategory,
    String? errorMessage,
  }) {
    return RecipeListState(
      isInitialLoading: isInitialLoading ?? this.isInitialLoading,
      categories: categories ?? this.categories,
      recipes: recipes ?? this.recipes,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
