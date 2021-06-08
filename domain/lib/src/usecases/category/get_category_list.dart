import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/repositories/category_repository.dart';

class GetCategoryList extends UseCase<List<Category>, NoParams> {
  GetCategoryList(this.categoryRepository);

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return categoryRepository.getCategoryList();
  }
}
