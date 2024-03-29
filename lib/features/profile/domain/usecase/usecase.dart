
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/entities.dart';
import '../repository/repository.dart';

class CalendarUseCase implements UseCase<List<CalendarEntities>, NoParams> {
  final CalendarRepository _repositoryImpl;
  CalendarUseCase({
    required CalendarRepository repositoryImpl,
  }) : _repositoryImpl = repositoryImpl;

  @override
  Future<Either<Failure, List<CalendarEntities>>> call(NoParams param) async {
    if (param is GetData) {
      return await _repositoryImpl.getData();
    } else {
      throw UnimplementedError();
    }
  }
}

class GetData extends NoParams {}
