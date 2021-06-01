import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

abstract class IDatabaseManager {
  Future<Either<Failure, bool>> initDatabase();
}

class DatabaseManagerDataSource implements IDatabaseManager {
  DatabaseManagerDataSource(this.todoDatabase);

  TodoDatabase todoDatabase;

  @override
  Future<Either<Failure, bool>> initDatabase() {
    return todoDatabase.initDb();
  }
}
