import '../repositories/recipe_repository.dart';
import '../../data/models/recipe_response_model.dart';

class SearchRecipes {
  final RecipeRepository repository;

  SearchRecipes(this.repository);

  Future<RecipeResponseModel> call(String query) {
    return repository.searchRecipes(query);
  }
}
