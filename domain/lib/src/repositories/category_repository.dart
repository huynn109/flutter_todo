import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategoryList();
  Future<Either<Failure, bool>> insertCategoryList(List<Category> categoryList);
}
