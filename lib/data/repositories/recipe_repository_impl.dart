import '../../domain/repositories/recipe_repository.dart';
import '../datasources/recipe_remote_data_source.dart';
import '../models/recipe_response_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl(this.remoteDataSource);

  //get recipe categories
  @override
  Future<List<String>> getRecipeTags() {
    return remoteDataSource.getRecipeTags();
  }

  //get all recipes
  @override
  Future<RecipeResponseModel> getRecipes() {
    return remoteDataSource.getRecipes();
  }

  //get recipes by tags
  @override
  Future<RecipeResponseModel> getRecipesByTag(String tag) {
    return remoteDataSource.getRecipesByTag(tag);
  }

  //search recipes
  @override
  Future<RecipeResponseModel> searchRecipes(String query) {
    return remoteDataSource.searchRecipes(query);
  }
}
