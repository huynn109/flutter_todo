// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    name: json['name'] as String?,
    todosNumber: json['todosNumber'] as int?,
    color: json['color'] as int?,
    icon: json['icon'] as int?,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'todosNumber': instance.todosNumber,
      'icon': instance.icon,
    };
