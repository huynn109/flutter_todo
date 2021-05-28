import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/errors/failure.dart';
import 'package:flutter_todo_simple/data/data.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class TodoDatabase {
  Future<Either<Failure, bool>> initDb();
  Future<bool> deleteDb();
  Future<Either<Failure, bool>> insertCategory(List<Category> categoryList);
  Future<bool> insertTodo(List<TodoModel> todoList);
  Future<bool> removeAllCategoryList();
  Future<bool> removeAllTodoList();
  Future<Either<Failure, List<CategoryModel>>> getCategoryList();
  Future<Either<Failure, List<TodoModel>>> getTodoList();
}
