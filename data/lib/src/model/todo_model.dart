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
      completed: (json[TodoModelKey.completed] != null &&
              json[TodoModelKey.completed] == 1)
          ? true
          : false,
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      TodoModelKey.text: text,
      TodoModelKey.date: date,
      TodoModelKey.time: time,
      TodoModelKey.completed: completed ? 1 : 0,
    };
    if (id != null) {
      map[TodoModelKey.id] = id;
    }

    return map;
  }

  static CategoryModel _getCategoriesFromJson(Map<String, dynamic> json) =>
      CategoryModel.fromJson(json);
}
