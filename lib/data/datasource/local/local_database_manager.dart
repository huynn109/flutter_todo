import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/data/database/todo_database.dart';

abstract class ILocalDatabaseManager {
  Future<Either<Failure, bool>> initDatabase();
}

class LocalDatabaseManager implements ILocalDatabaseManager {
  LocalDatabaseManager(this.todoDatabase);

  TodoDatabase todoDatabase;

  @override
  Future<Either<Failure, bool>> initDatabase() {
    return todoDatabase.initDb();
  }
}
