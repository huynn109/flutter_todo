import 'package:dio/dio.dart';
import 'package:flutter_todo_simple/data/data.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/top-headlines?language=en&pageSize=100&apiKey={apikey}")
  Future<List<TodoModel>> getTodoList(@Path('apikey') String? apikey);

  @GET("/top-headlines?language=en&pageSize=100&apiKey={apikey}")
  Future<List<CategoryModel>> getCategoryList(@Path('apikey') String? apikey);
}
