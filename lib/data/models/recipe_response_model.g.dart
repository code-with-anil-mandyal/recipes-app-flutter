// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeResponseModel _$RecipeResponseModelFromJson(Map<String, dynamic> json) =>
    RecipeResponseModel(
      recipes: (json['recipes'] as List<dynamic>)
          .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeResponseModelToJson(
  RecipeResponseModel instance,
) => <String, dynamic>{
  'recipes': instance.recipes,
  'total': instance.total,
  'skip': instance.skip,
  'limit': instance.limit,
};
