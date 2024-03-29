
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/entities.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarDataSource _dataSource;
  CalendarRepositoryImpl({required CalendarDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<CalendarEntities>>> getData() async {
    try {
      final result = await _dataSource.getData();
      return Right(result);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }
}
