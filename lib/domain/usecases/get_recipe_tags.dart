import '../repositories/recipe_repository.dart';

class GetRecipeTags {
  final RecipeRepository repository;

  GetRecipeTags(this.repository);

  Future<List<String>> call() {
    return repository.getRecipeTags();
  }
}
