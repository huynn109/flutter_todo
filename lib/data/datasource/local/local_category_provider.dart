import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/data/database/todo_database.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class ILocalCategoryProvider {
  Future<Either<Failure, List<Category>>> getCategoryList();
  Future<Either<Failure, bool>> insertCategoryList(List<Category> categoryList);
}

class LocalCategoryProvider implements ILocalCategoryProvider {
  final TodoDatabase todoDatabase;

  LocalCategoryProvider({required this.todoDatabase});

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() {
    return todoDatabase.getCategoryList();
  }

  @override
  Future<Either<Failure, bool>> insertCategoryList(
      List<Category> categoryList) {
    return todoDatabase.insertCategory(categoryList);
  }
}
