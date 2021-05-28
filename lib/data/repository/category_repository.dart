import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/errors/failure.dart';
import 'package:flutter_todo_simple/data/datasource/local/local_category_provider.dart';
import 'package:flutter_todo_simple/data/datasource/network/api_category_provider.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(
      {required this.apiCategoryProvider, required this.localCategoryProvider});

  final IApiCategoryProvider apiCategoryProvider;
  final ILocalCategoryProvider localCategoryProvider;

  @override
  Future<Either<Failure, List<Category>>> getLocalCategoryList() {
    return localCategoryProvider.getCategoryList();
  }

  @override
  Future<Either<Failure, List<Category>>> getRemoteCategoryList() {
    return apiCategoryProvider.getCategoryList();
  }

  @override
  Future<Either<Failure, bool>> insertLocalCategoryList(
      List<Category> categoryList) {
    return localCategoryProvider.insertCategoryList(categoryList);
  }
}
