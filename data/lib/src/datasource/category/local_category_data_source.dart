import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ILocalCategory {
  Future<Either<Failure, List<Category>>> getCategoryList();

  Future<Either<Failure, bool>> insertCategoryList(
    List<Category> categoryList,
  );
}

class LocalCategoryDataSource implements ILocalCategory {
  final TodoDatabase todoDatabase;

  LocalCategoryDataSource({required this.todoDatabase});

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() {
    return todoDatabase.getCategoryList();
  }

  @override
  Future<Either<Failure, bool>> insertCategoryList(
    List<Category> categoryList,
  ) {
    return todoDatabase.insertCategory(categoryList);
  }
}
