import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class RemoteCategoryRepository {
  Future<Either<Failure, List<Category>>> getRemoteCategoryList();
}
