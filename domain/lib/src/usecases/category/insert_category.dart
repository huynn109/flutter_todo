import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class InsertCategoryList extends UseCase<bool, List<Category>> {
  InsertCategoryList(this.categoryRepository);

  CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, bool>> call(List<Category> params) {
    return categoryRepository.insertCategoryList(params);
  }

  List<Category> fakeDataCategory() => Categories.initial().categories;
}
