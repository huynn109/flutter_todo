import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class LocalCategoryRepository {
  Future<Either<Failure, List<Category>>> getLocalCategoryList();
  Future<Either<Failure, bool>> insertLocalCategoryList(
      List<Category> categoryList);
}
