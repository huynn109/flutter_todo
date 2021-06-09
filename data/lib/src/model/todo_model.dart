import 'package:data/src/model/category_model.dart';
import 'package:domain/domain.dart';

class TodoModelKey {
  static const id = 'id';
  static const text = 'text';
  static const category = 'category';
  static const name = 'name';
  static const date = 'date';
  static const time = 'time';
  static const completed = 'completed';
}

class TodoModel extends Todo {
  int? id;
  String? text;
  Category? category;
  String? date;
  String? time;
  bool completed;

  TodoModel({
    required this.id,
    this.text,
    this.category,
    this.date,
    this.time,
    this.completed = false,
  }) : super(id: id);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json[TodoModelKey.id] as int,
      text: json[TodoModelKey.text] ?? null,
      category: _getCategoriesFromJson(json),
      date: json[TodoModelKey.date] ?? null,
      time: json[TodoModelKey.time] ?? null,
      completed: json[TodoModelKey.completed] != null ? true : false,
    );
  }

  Map<String, dynamic> toJson(TodoModel todoModel) => <String, dynamic>{
        TodoModelKey.id: todoModel.id,
        TodoModelKey.text: todoModel.text,
        TodoModelKey.category: todoModel.category,
        TodoModelKey.date: todoModel.date,
        TodoModelKey.time: todoModel.time,
        TodoModelKey.completed: todoModel.completed,
      };

  static CategoryModel _getCategoriesFromJson(Map<String, dynamic> json) =>
      CategoryModel.fromJson(json);
}
