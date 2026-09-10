import 'package:json_annotation/json_annotation.dart';

import 'recipe_model.dart';

part 'recipe_response_model.g.dart';

@JsonSerializable()
class RecipeResponseModel {
  final List<RecipeModel> recipes;
  final int total;
  final int skip;
  final int limit;

  const RecipeResponseModel({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeResponseModelToJson(this);
}
