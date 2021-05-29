import 'package:dio/dio.dart';
import 'package:flutter_todo_simple/data/data.dart';
import 'package:flutter_todo_simple/data/database/todo_database.dart';
import 'package:flutter_todo_simple/data/datasource/local/local_category_provider.dart';
import 'package:flutter_todo_simple/data/datasource/local/local_database_manager.dart';
import 'package:flutter_todo_simple/data/datasource/network/api_category_provider.dart';
import 'package:flutter_todo_simple/data/mapper/category_mapper.dart';
import 'package:flutter_todo_simple/data/repository/database_repository.dart';
import 'package:flutter_todo_simple/data/repository/todo_repository.dart';
import 'package:flutter_todo_simple/data/service/retrofit/retrofit.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:flutter_todo_simple/domain/repositories/database_repository.dart';
import 'package:flutter_todo_simple/domain/repositories/local/local_category_repository.dart';
import 'package:flutter_todo_simple/domain/repositories/local/local_todo_repository.dart';
import 'package:flutter_todo_simple/domain/repositories/remote/remote_category_repository.dart';
import 'package:flutter_todo_simple/domain/repositories/remote/remote_todo_repository.dart';
import 'package:flutter_todo_simple/domain/usecases/init_sqflite_database.dart';
import 'package:flutter_todo_simple/domain/usecases/insert_local_category_list.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureFeatureModule();
  }

  void _configureFeatureModule() {
    _configureFeatureModuleInstance();
    _configureFeatureModuleFactories();
  }

  void _configureFeatureModuleInstance() {
    container.registerInstance(
      RestClient(
        Dio(
          BaseOptions(contentType: "application/json"),
        ),
      ),
    );
  }

  @Register.singleton(TodoDatabase, from: SqfLiteDatabase)
  @Register.factory(CategoryMapper, from: CategoryMapperImpl)
  @Register.factory(IApiCategoryProvider, from: ApiCategoryProvider)
  @Register.factory(ILocalCategoryProvider, from: LocalCategoryProvider)
  @Register.factory(ILocalTodoProvider, from: LocalTodoProvider)
  @Register.factory(IApiTodoProvider, from: ApiTodoProvider)
  @Register.factory(CategoryRepository, from: CategoryRepositoryImpl)
  @Register.factory(LocalCategoryRepository, from: CategoryRepositoryImpl)
  @Register.factory(RemoteCategoryRepository, from: CategoryRepositoryImpl)
  @Register.factory(TodoRepository, from: TodoRepositoryImpl)
  @Register.factory(LocalTodoRepository, from: TodoRepositoryImpl)
  @Register.factory(RemoteTodoRepository, from: TodoRepositoryImpl)
  @Register.factory(DatabaseRepository, from: DatabaseRepositoryImpl)
  @Register.factory(ILocalDatabaseManager, from: LocalDatabaseManager)
  @Register.factory(GetLocalCategoryList)
  @Register.factory(GetLocalTodoList)
  @Register.factory(InsertLocalCategoryList)
  @Register.factory(InitSqfLiteDatabase)
  void _configureFeatureModuleFactories();
}
