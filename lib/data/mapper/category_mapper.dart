import 'package:flutter_todo_simple/data/data.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

class CategoryMapperImpl implements CategoryMapper<Category, CategoryModel> {
  @override
  CategoryModel fromEntity(Category from) {
    return CategoryModel(
      name: from.name,
      color: from.color,
      icon: from.icon,
      todosNumber: from.todosNumber,
    );
  }

  @override
  Category toEntity(CategoryModel from) {
    return Category(
      name: from.name,
      color: from.color,
      icon: from.icon,
      todosNumber: from.todosNumber,
    );
  }
}
