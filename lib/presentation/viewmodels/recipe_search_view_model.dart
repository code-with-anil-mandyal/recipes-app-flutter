import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_search_recipes.dart';
import '../providers/recipe_providers.dart';
import '../states/recipe_search_state.dart';

final recipeSearchViewModelProvider =
    NotifierProvider<RecipeSearchViewModel, RecipeSearchState>(
      RecipeSearchViewModel.new,
    );

class RecipeSearchViewModel extends Notifier<RecipeSearchState> {
  late final SearchRecipes _searchRecipes;

  @override
  RecipeSearchState build() {
    _searchRecipes = ref.watch(searchRecipesProvider);

    return const RecipeSearchState();
  }

  Future<void> search(String query) async {
    final trimmedQuery = query.trim();

    if (trimmedQuery.isEmpty) {
      state = state.copyWith(isLoading: false, recipes: [], query: '');
      return;
    }

    state = state.copyWith(
      isLoading: true,
      query: trimmedQuery,
      errorMessage: null,
    );

    try {
      final response = await _searchRecipes(trimmedQuery);

      state = state.copyWith(isLoading: false, recipes: response.recipes);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        recipes: [],
      );
    }
  }

  void clearSearch() {
    state = state.copyWith(
      isLoading: false,
      recipes: [],
      query: '',
      errorMessage: null,
    );
  }
}
