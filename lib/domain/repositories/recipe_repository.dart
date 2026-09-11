import '../../data/models/recipe_response_model.dart';

abstract class RecipeRepository {
  //get categories
  Future<List<String>> getRecipeTags();

  //get all recipes
  Future<RecipeResponseModel> getRecipes();

  //get recipes based on category
  Future<RecipeResponseModel> getRecipesByTag(String tag);

  //search recipes
  Future<RecipeResponseModel> searchRecipes(String query);
}
