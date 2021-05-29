import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/app/di/injector.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:flutter_todo_simple/domain/usecases/insert_local_category_list.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final getLocalCategoryList = Injector.resolve<GetLocalCategoryList>();
  final getLocalTodoList = Injector.resolve<GetLocalTodoList>();
  final insertLocalCategoryList = Injector.resolve<InsertLocalCategoryList>();

  final viewState = ViewState.initial.obs;

  RxList categoryList = [].obs;
  RxList todoList = [].obs;

  @override
  void onReady() {
    loadCategoryList();
    loadTodoList();
    super.onReady();
  }

  Future<void> loadTodoList() async =>
      handleResultTodoList(await getLocalTodoList.call(NoParams()));

  void handleResultTodoList(Either<Failure, List<Todo>> resultLocalTodo) {
    resultLocalTodo.fold(
      (l) => _setViewState(ViewState.error),
      (todoDataList) => _handleResultFor(todoDataList),
    );
  }

  Future<void> loadCategoryList() async =>
      handleResultCategoryList(await getLocalCategoryList.call(NoParams()));

  void _handleResultFor(List<Todo> todoDataList) {
    if (todoDataList.isEmpty) {
      _setEmptyTodoList();
    } else {
      _setDataTodoList(todoDataList);
    }
  }

  void _setDataTodoList(List<Todo> data) {
    viewState.value = ViewState.data;
    todoList.addAll(data);
  }

  void _setEmptyTodoList() => viewState.value = ViewState.empty;

  void handleResultCategoryList(
      Either<Failure, List<Category>> resultLocalCategory) {
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

  void _setViewState(ViewState state) {
    viewState.value = state;
  }
}
