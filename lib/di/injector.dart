import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
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

  // Mapper
  @Register.factory(TodoMapper)

  // Data source
  @Register.factory(IRemoteCategory, from: RemoteCategoryDataSource)
  @Register.factory(ILocalCategory, from: LocalCategoryDataSource)
  @Register.factory(ILocalTodo, from: LocalTodoDataSource)
  @Register.factory(IRemoteTodo, from: RemoteTodoDataSource)
  @Register.factory(IDatabaseManager, from: DatabaseManagerDataSource)

  // Repository
  @Register.factory(CategoryRepository, from: CategoryRepositoryImpl)
  @Register.factory(TodoRepository, from: TodoRepositoryImpl)
  @Register.factory(DatabaseRepository, from: DatabaseRepositoryImpl)

  // Use case
  @Register.factory(GetCategoryList)
  @Register.factory(GetTodoList)
  @Register.factory(InsertCategoryList)
  @Register.factory(InsertTodo)
  @Register.factory(InitDatabase)
  @Register.factory(RemoveTodoList)
  @Register.factory(RemoveTodo)
  @Register.factory(RevertCompleteTodo)
  void _configureFeatureModuleFactories();
}
