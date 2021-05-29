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
    container.registerFactory<CategoryMapper<dynamic, dynamic>>(
        (c) => CategoryMapperImpl());
    container.registerFactory<IApiCategoryProvider>(
        (c) => ApiCategoryProvider(client: c<RestClient>()));
    container.registerFactory<ILocalCategoryProvider>(
        (c) => LocalCategoryProvider(todoDatabase: c<TodoDatabase>()));
    container.registerFactory<ILocalTodoProvider>((c) => LocalTodoProvider(
        todoDatabase: c<TodoDatabase>(),
        categoryMapper: c<CategoryMapper<dynamic, dynamic>>()));
    container.registerFactory<IApiTodoProvider>(
        (c) => ApiTodoProvider(client: c<RestClient>()));
    container.registerFactory<CategoryRepository>((c) => CategoryRepositoryImpl(
        apiCategoryProvider: c<IApiCategoryProvider>(),
        localCategoryProvider: c<ILocalCategoryProvider>()));
    container.registerFactory<LocalCategoryRepository>((c) =>
        CategoryRepositoryImpl(
            apiCategoryProvider: c<IApiCategoryProvider>(),
            localCategoryProvider: c<ILocalCategoryProvider>()));
    container.registerFactory<RemoteCategoryRepository>((c) =>
        CategoryRepositoryImpl(
            apiCategoryProvider: c<IApiCategoryProvider>(),
            localCategoryProvider: c<ILocalCategoryProvider>()));
    container.registerFactory<TodoRepository>((c) => TodoRepositoryImpl(
        apiTodoProvider: c<IApiTodoProvider>(),
        localTodoProvider: c<ILocalTodoProvider>()));
    container.registerFactory<LocalTodoRepository>((c) => TodoRepositoryImpl(
        apiTodoProvider: c<IApiTodoProvider>(),
        localTodoProvider: c<ILocalTodoProvider>()));
    container.registerFactory<RemoteTodoRepository>((c) => TodoRepositoryImpl(
        apiTodoProvider: c<IApiTodoProvider>(),
        localTodoProvider: c<ILocalTodoProvider>()));
    container.registerFactory<DatabaseRepository>(
        (c) => DatabaseRepositoryImpl(c<ILocalDatabaseManager>()));
    container.registerFactory<ILocalDatabaseManager>(
        (c) => LocalDatabaseManager(c<TodoDatabase>()));
    container.registerFactory(
        (c) => GetLocalCategoryList(c<LocalCategoryRepository>()));
    container
        .registerFactory((c) => GetLocalTodoList(c<LocalTodoRepository>()));
    container.registerFactory(
        (c) => InsertLocalCategoryList(c<LocalCategoryRepository>()));
    container
        .registerFactory((c) => InitSqfLiteDatabase(c<DatabaseRepository>()));
  }
}
