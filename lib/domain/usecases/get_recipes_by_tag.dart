import '../repositories/recipe_repository.dart';
import '../../../data/models/recipe_response_model.dart';

//get recipes by categories/tags
class GetRecipesByTag {
  final RecipeRepository repository;

  GetRecipesByTag(this.repository);

  Future<RecipeResponseModel> call(String tag) {
    return repository.getRecipesByTag(tag);
  }
}
