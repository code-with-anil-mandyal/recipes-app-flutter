import '../repositories/recipe_repository.dart';
import '../../../data/models/recipe_response_model.dart';

// get all recipes
class GetRecipes {
  final RecipeRepository repository;

  GetRecipes(this.repository);

  Future<RecipeResponseModel> call() {
    return repository.getRecipes();
  }
}
