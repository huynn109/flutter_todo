import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/src/service/retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IRemoteCategory {
  Future<Either<Failure, List<Category>>> getCategoryList();
}

class RemoteCategoryDataSource implements IRemoteCategory {
  final RestClient client;
  RemoteCategoryDataSource({required this.client});

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() async {
    try {
      final todoList = await client.getCategoryList(dotenv.env['API_KEY']);

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
