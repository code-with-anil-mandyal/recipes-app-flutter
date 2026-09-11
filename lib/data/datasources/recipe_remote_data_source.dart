import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:recipes_app/data/models/recipe_response_model.dart';

part 'recipe_remote_data_source.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class RecipeRemoteDataSource {
  factory RecipeRemoteDataSource(Dio dio) = _RecipeRemoteDataSource;

  @GET('recipes/tags')
  Future<List<String>> getRecipeTags();

  @GET('recipes')
  Future<RecipeResponseModel> getRecipes({@Query('limit') int limit = 0});

  @GET('recipes/tag/{tag}')
  Future<RecipeResponseModel> getRecipesByTag(
    @Path('tag') String tag, {
    @Query('limit') int limit = 0,
  });

  @GET('recipes/search')
  Future<RecipeResponseModel> searchRecipes(@Query('q') String query);
}
