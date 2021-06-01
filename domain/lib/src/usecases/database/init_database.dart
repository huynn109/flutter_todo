import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class InitDatabase extends UseCase<bool, NoParams> {
  InitDatabase(this.databaseRepository);

  DatabaseRepository databaseRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return databaseRepository.initDatabase();
  }
}
