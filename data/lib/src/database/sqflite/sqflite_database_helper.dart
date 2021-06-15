import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteDatabase extends TodoDatabase {
  final _kDbFileName = 'sqflite_todo.db';
  final _kDBTodoTableName = 'todo_table';
  final _kDBCategoryTableName = 'category_table';
  final _kDBVersion = 1;
  Database? _database;

  @override
  Future<Either<Failure, bool>> initDb() async {
    try {
      String dbFolderPath = await getDbFolderPath();
      if (await dbPathNotExists(dbFolderPath)) {
        await createDbPathWith(dbFolderPath);
      }
      await createDbTable(await getDbPath());

      return Right(true);
    } on DatabaseException catch (e) {
      Logger.write(e.toString());

      return Left(Failure(e.toString()));
    }
  }

  Future<void> createDbPathWith(String path) async {
    await Directory(path).create(recursive: true);
  }

  Future<void> createDbTable(String dbPath) async {
    _database = await openDatabase(
      dbPath,
      version: _kDBVersion,
      onCreate: (database, version) async {
        await _initCategoryTable(database);
        await _initTodoTable(database);
      },
    );
  }

  Future<bool> dbPathExists(String dbPath) async =>
      await Directory(dbPath).exists();

  Future<bool> dbPathNotExists(String dbPath) async =>
      !await Directory(dbPath).exists();

  @override
  Future<bool> deleteDb() async {
    try {
      String dbPath = await getDbPath();
      if (await dbPathExists(dbPath)) {
        await deleteDatabase(dbPath);
        _database = null;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String> getDbFolderPath() async {
    final dbFolder = await getDatabasesPath();

    return dbFolder;
  }

  Future<String> getDbPath() async {
    final dbPath = join(await getDbFolderPath(), _kDbFileName);

    return dbPath;
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getTodoList() async {
    final todoJsonList = await _database?.query(
      _kDBTodoTableName,
    );
    if (todoJsonList == null) {
      Logger.write("Todo is null");

      return Left(
        Failure("Todo is null"),
      );
    }

    return Right(
      List<TodoModel>.from(
        todoJsonList.map(
          (e) => TodoModel.fromJson(e),
        ),
      ),
    );
  }

  @override
  Future<bool> insertTodoList(List<Todo> todoList) async {
    if (todoList.isEmpty) return false;
    await removeAllTodoList();
    final validatedTodoList = validateTodoDataList(todoList);
    try {
      for (final todoModel in validatedTodoList) {
        await _database?.transaction(
          (txn) async {
            await txn.rawInsert('''
          INSERT INTO $_kDBTodoTableName 
          (
          text,
          category,
          date,
          time,
          completed
          )
          VALUES
            (
              "${todoModel.text}",
              "${todoModel.category}",
              "${todoModel.date}",
              "${todoModel.time}",
              "${todoModel.completed}"
            )''');
          },
        );
      }

      return true;
    } on DatabaseException catch (e) {
      print(e);

      return false;
    }
  }

  @override
  Future<Either<Failure, int>> insertTodo(TodoModel todoModel) async {
    try {
      var id = await _database?.insert(_kDBTodoTableName, todoModel.toJson());

      return Right(id ?? -1);
    } on DatabaseException catch (e) {
      print(e);

      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> insertCategory(
    List<Category> categoryList,
  ) async {
    if (categoryList.isEmpty) return Left(Failure("Category data is empty"));
    await removeAllCategoryList();
    final validatedCategoryList = validateCategoryDataList(categoryList);
    try {
      for (final category in validatedCategoryList) {
        await _database?.transaction(
          (txn) async {
            await txn.rawInsert(
              '''INSERT INTO $_kDBCategoryTableName (name, color, icon) VALUES("${category.name}", ${category.color}, ${category.icon})''',
            );
          },
        );
      }

      return Right(true);
    } on DatabaseException catch (e) {
      print(e);

      return Left(Failure(e.toString()));
    }
  }

  Future<void> _initCategoryTable(Database database) async {
    await database.execute('''
          CREATE TABLE $_kDBCategoryTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
          name TEXT,
          color INTEGER,
          icon INTEGER
          )
        ''');
  }

  Future<void> _initTodoTable(Database database) async {
    await database.execute('''
          CREATE TABLE $_kDBTodoTableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
          text TEXT,
          category INTEGER,
          date TEXT,
          time TEXT,
          completed INTEGER,
          FOREIGN KEY(category) REFERENCES category(id)
          )
        ''');
  }

  List<TodoModel> validateTodoDataList(List<Todo> todoList) {
    final validTodoList = <TodoModel>[];
    for (final todoItem in todoList) {
      final validText = todoItem.text?.replaceAll('"', "'");
      final validDate = todoItem.date?.replaceAll('"', "'");
      final validTime = todoItem.time?.replaceAll('"', "'");
      final validTodo = TodoModel(
        id: 0,
        text: validText,
        category: todoItem.category,
        date: validDate,
        time: validTime,
        completed: todoItem.completed,
      );
      validTodoList.add(validTodo);
    }

    return validTodoList;
  }

  List<Category> validateCategoryDataList(
    List<Category> categoryList,
  ) {
    final validCategoryList = <Category>[];
    for (final category in categoryList) {
      final validName = category.name?.replaceAll('"', "'");
      final validCategory = CategoryModel(
        name: validName,
        icon: category.icon,
        color: category.color,
      );
      validCategoryList.add(validCategory);
    }

    return validCategoryList;
  }

  @override
  Future<bool> removeAllTodoList() async {
    await _database?.delete(_kDBTodoTableName);

    return true;
  }

  @override
  Future<bool> removeAllCategoryList() async {
    await _database?.delete(_kDBCategoryTableName);

    return true;
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategoryList() async {
    final categoryJsonList =
        await _database?.rawQuery('SELECT * FROM $_kDBCategoryTableName');

    return Right(categoryJsonList
            ?.map(
              (e) => CategoryModel.fromJson(e),
            )
            .toList() ??
        []);
  }

  @override
  Future<Either<Failure, bool>> removeTodoBy(int id) async {
    try {
      await _database?.delete(
        _kDBTodoTableName,
        where: "id = ?",
        whereArgs: [id],
      );

      return Right(true);
    } on DatabaseException catch (e) {
      print(e);

      return Left(Failure(e.toString()));
    }
  }
}
