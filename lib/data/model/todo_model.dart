import 'package:flutter_todo_simple/data/data.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Todo {
  TodoModel({
    String? text,
    CategoryModel? category,
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

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
