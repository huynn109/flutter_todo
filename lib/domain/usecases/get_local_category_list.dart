import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:flutter_todo_simple/domain/repositories/local/local_category_repository.dart';

class GetLocalCategoryList extends UseCase<List<Category>, NoParams> {
  final LocalCategoryRepository localCategoryRepository;

  GetLocalCategoryList(this.localCategoryRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return localCategoryRepository.getLocalCategoryList();
  }
}
