import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class TodoDatabase {
  Future<Either<Failure, bool>> initDb();

  Future<bool> deleteDb();

  Future<Either<Failure, bool>> insertCategory(
    List<Category> categoryList,
  );

  Future<Either<Failure, int>> insertTodo(Todo todoModel);

  Future<bool> insertTodoList(List<Todo> todoModelList);

  Future<bool> removeAllCategoryList();

  Future<bool> removeAllTodoList();

  Future<Either<Failure, bool>> removeTodoBy(int id);

  Future<Either<Failure, List<Category>>> getCategoryList();

  Future<Either<Failure, List<Todo>>> getTodoList();
}
