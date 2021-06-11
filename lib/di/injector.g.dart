// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoDatabase>((c) => SqfLiteDatabase());
    container.registerFactory((c) => TodoMapper());
    container.registerFactory<IRemoteCategory>(
        (c) => RemoteCategoryDataSource(client: c<RestClient>()));
    container.registerFactory<ILocalCategory>(
        (c) => LocalCategoryDataSource(todoDatabase: c<TodoDatabase>()));
    container.registerFactory<ILocalTodo>(
        (c) => LocalTodoDataSource(todoDatabase: c<TodoDatabase>()));
    container.registerFactory<IRemoteTodo>(
        (c) => RemoteTodoDataSource(client: c<RestClient>()));
    container.registerFactory<IDatabaseManager>(
        (c) => DatabaseManagerDataSource(c<TodoDatabase>()));
    container.registerFactory<CategoryRepository>((c) => CategoryRepositoryImpl(
        remoteCategory: c<IRemoteCategory>(),
        localCategory: c<ILocalCategory>()));
    container.registerFactory<TodoRepository>((c) => TodoRepositoryImpl(
        localTodo: c<ILocalTodo>(),
        remoteTodo: c<IRemoteTodo>(),
        todoMapper: c<TodoMapper>()));
    container.registerFactory<DatabaseRepository>(
        (c) => DatabaseRepositoryImpl(c<IDatabaseManager>()));
    container.registerFactory((c) => GetCategoryList(c<CategoryRepository>()));
    container.registerFactory((c) => GetTodoList(c<TodoRepository>()));
    container
        .registerFactory((c) => InsertCategoryList(c<CategoryRepository>()));
    container.registerFactory((c) => InsertTodo(c<TodoRepository>()));
    container.registerFactory((c) => InitDatabase(c<DatabaseRepository>()));
    container.registerFactory((c) => RemoveTodoList(c<TodoRepository>()));
    container.registerFactory((c) => RemoveTodo(c<TodoRepository>()));
  }
}
