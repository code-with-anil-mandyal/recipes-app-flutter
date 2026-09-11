import '../../data/models/recipe_model.dart';

class RecipeSearchState {
  final bool isLoading;
  final List<RecipeModel> recipes;
  final String query;
  final String? errorMessage;

  const RecipeSearchState({
    this.isLoading = false,
    this.recipes = const [],
    this.query = '',
    this.errorMessage,
  });

  RecipeSearchState copyWith({
    bool? isLoading,
    List<RecipeModel>? recipes,
    String? query,
    String? errorMessage,
  }) {
    return RecipeSearchState(
      isLoading: isLoading ?? this.isLoading,
      recipes: recipes ?? this.recipes,
      query: query ?? this.query,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
