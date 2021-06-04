import 'package:domain/domain.dart';

class TodoModel extends Todo {
  TodoModel({
    String? text,
    Category? category,
    String? date,
    String? time,
    bool completed = false,
  }) : super(
          text: text,
          category: category,
          date: date,
          time: time,
          completed: completed,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    List<String> images = [];
    if (json['images'] != null) {
      (json['images'] as List).forEach((f) => images.add(f['src']));
    }

    return TodoModel(
      text: json['text'] ?? null,
      category: _getCategoriesFromJson(json),
      date: json['date'] ?? null,
      time: json['time'] ?? null,
      completed: json['completed'] != null ? true : false,
    );
  }

  static Category _getCategoriesFromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] ?? null,
      color: json['color'] != null ? (json['color'] as num).toInt() : null,
      icon: json['icon'] != null ? (json['icon'] as num).toInt() : null,
    );
  }
}
