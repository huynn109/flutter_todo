// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return TodoModel(
    text: json['text'] as String?,
    category: json['category'] == null
        ? null
        : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    date: json['date'] as String?,
    time: json['time'] as String?,
    completed: json['completed'] as bool,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'category': instance.category,
      'date': instance.date,
      'time': instance.time,
      'completed': instance.completed,
    };
