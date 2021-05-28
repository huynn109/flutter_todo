import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/errors/failure.dart';
import 'package:flutter_todo_simple/data/datasource/local/local_database_manager.dart';
import 'package:flutter_todo_simple/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl(this.localDatabaseManager);

  ILocalDatabaseManager localDatabaseManager;

  @override
  Future<Either<Failure, bool>> initDatabase() {
    return localDatabaseManager.initDatabase();
  }
}
