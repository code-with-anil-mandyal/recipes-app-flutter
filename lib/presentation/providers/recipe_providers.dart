import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/recipe_remote_data_source.dart';
import '../../data/repositories/recipe_repository_impl.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/usecases/get_recipe_tags.dart';
import '../../domain/usecases/get_recipes.dart';
import '../../domain/usecases/get_recipes_by_tag.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final recipeRemoteDataSourceProvider = Provider<RecipeRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);

  return RecipeRemoteDataSource(dio);
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final remoteDataSource = ref.watch(recipeRemoteDataSourceProvider);

  return RecipeRepositoryImpl(remoteDataSource);
});

//get categories/tags
final getRecipeTagsProvider = Provider<GetRecipeTags>((ref) {
  final repository = ref.watch(recipeRepositoryProvider);

  return GetRecipeTags(repository);
});

//get recipes
final getRecipesProvider = Provider<GetRecipes>((ref) {
  final repository = ref.watch(recipeRepositoryProvider);

  return GetRecipes(repository);
});

//get recipes by category
final getRecipesByTagProvider = Provider<GetRecipesByTag>((ref) {
  final repository = ref.watch(recipeRepositoryProvider);

  return GetRecipesByTag(repository);
});
