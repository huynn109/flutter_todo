import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/app/resources/resource.dart';
import 'package:flutter_todo_simple/data/service/retrofit/retrofit.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class IApiCategoryProvider {
  Future<Either<Failure, List<Category>>> getCategoryList();
}

class ApiCategoryProvider implements IApiCategoryProvider {
  final RestClient client;
  ApiCategoryProvider({required this.client});

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() async {
    try {
      final todoList = await client.getCategoryList(env['API_KEY']);
      return Right(todoList);
    } on DioError catch (error) {
      print(error.type);
      print(error.message);
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
