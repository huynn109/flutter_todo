import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/domain/entity/category.dart';
import 'package:flutter_todo_simple/domain/repositories/local/local_category_repository.dart';

class InsertLocalCategoryList extends UseCase<bool, List<Category>> {
  LocalCategoryRepository localCategoryRepository;

  InsertLocalCategoryList(this.localCategoryRepository);

  @override
  Future<Either<Failure, bool>> call(List<Category> params) {
    return localCategoryRepository.insertLocalCategoryList(params);
  }

  List<Category> fakeDataCategory() => Categories.initial().categories;
}
