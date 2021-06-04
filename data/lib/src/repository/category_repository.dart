import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/src/datasource/category/local_category_data_source.dart';
import 'package:data/src/datasource/category/remote_category_data_source.dart';
import 'package:domain/domain.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.remoteCategory,
    required this.localCategory,
  });

  final IRemoteCategory remoteCategory;
  final ILocalCategory localCategory;

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() {
    return localCategory.getCategoryList();
  }

  @override
  Future<Either<Failure, bool>> insertCategoryList(
    List<Category> categoryList,
  ) {
    return localCategory.insertCategoryList(categoryList);
  }
}
