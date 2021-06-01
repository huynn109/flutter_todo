import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/src/datasource/database/database_manager_data_source.dart';
import 'package:domain/domain.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl(this.databaseManager);

  IDatabaseManager databaseManager;

  @override
  Future<Either<Failure, bool>> initDatabase() {
    return databaseManager.initDatabase();
  }
}
