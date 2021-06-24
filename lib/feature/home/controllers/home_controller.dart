import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter_todo_simple/di/injector.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final getCategoryList = Injector.resolve<GetCategoryList>();
  final getTodoList = Injector.resolve<GetTodoList>();
  final insertCategoryList = Injector.resolve<InsertCategoryList>();
  final removeTodo = Injector.resolve<RemoveTodo>();
  final revertCompleteTodo = Injector.resolve<RevertCompleteTodo>();

  final Rx<ViewState> viewState = ViewState.initial.obs;
  final RxList categoryList = [].obs;
  final RxList todoList = [].obs;

  @override
  void onReady() {
    loadCategoryList();
    loadTodoList();
    super.onReady();
  }

  Future<void> loadTodoList() async =>
      handleResultTodoList(await getTodoList.call(NoParams()));

  void handleResultTodoList(Either<Failure, List<Todo>> resultLocalTodo) {
    resultLocalTodo.fold(
      (l) => _setViewState(ViewState.error),
      (todoDataList) => _handleResultFor(todoDataList),
    );
  }

  Future<void> loadCategoryList() async =>
      handleResultCategoryList(await getCategoryList.call(NoParams()));

  void _handleResultFor(List<Todo> todoDataList) {
    if (todoDataList.isEmpty) {
      _setEmptyTodoList();
    } else {
      _setDataTodoList(todoDataList);
    }
  }

  void _setDataTodoList(List<Todo> data) {
    todoList.clear();
    todoList.addAll(data);
    if (viewState.value != ViewState.data) {
      _setViewState(ViewState.data);
    }
  }

  void _setEmptyTodoList() => viewState.value = ViewState.empty;

  void handleResultCategoryList(
    Either<Failure, List<Category>> resultLocalCategory,
  ) {
    resultLocalCategory.fold(
      (l) => _setViewState(ViewState.error),
      (categoryDataList) {
        _setViewState(ViewState.data);
        _setDataCategoryList(categoryDataList);
      },
    );
  }

  void _setDataCategoryList(List<Category> categoryDataList) {
    categoryList.addAll(categoryDataList);
  }

  Future<void> removeTodoBy(int? id) async {
    if (id != null)
      handleResultInsertTodo(
        await removeTodo.call(
          ParamRemoveTodo(id),
        ),
      );
  }

  void handleResultInsertTodo(Either<Failure, bool> resultInsertTodo) {
    resultInsertTodo.fold((l) => null, (result) {
      if (result) loadTodoList();
    });
  }

  void _setViewState(ViewState state) {
    viewState.value = state;
  }

  Future<void> completeTodo(Todo todo) async {
    handleResultUpdateTodo(
      await revertCompleteTodo.call(
        ParamUpdateTodo(todo),
      ),
    );
  }

  void handleResultUpdateTodo(Either<Failure, bool> revertCompleteTodo) {
    revertCompleteTodo.fold((l) => null, (result) {
      if (result) loadTodoList();
    });
  }
}
