import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  CategoryModel({
    String? name,
    int? todosNumber = 0,
    int? color,
    int? icon,
  }) : super(
          name: name,
          todosNumber: todosNumber,
          color: color,
          icon: icon,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
