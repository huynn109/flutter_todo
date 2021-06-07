import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryModelKey {
  static const name = 'name';
  static const todosNumber = 'todosNumber';
  static const color = 'color';
  static const icon = 'icon';
}

@JsonSerializable()
class CategoryModel extends Category {
  CategoryModel({
    String? name,
    int? todosNumber = 0,
    int? color,
    int? icon,
  }) : super(
          name: name,
          todosNumber: todosNumber,
          color: color,
          icon: icon,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json[CategoryModelKey.name] as String?,
      todosNumber: json[CategoryModelKey.todosNumber] as int?,
      color: json[CategoryModelKey.color] as int?,
      icon: json[CategoryModelKey.icon] as int?,
    );
  }

  Map<String, dynamic> toJson(CategoryModel categoryModel) => <String, dynamic>{
        CategoryModelKey.name: categoryModel.name,
        CategoryModelKey.color: categoryModel.color,
        CategoryModelKey.todosNumber: categoryModel.todosNumber,
        CategoryModelKey.icon: categoryModel.icon,
      };
}
