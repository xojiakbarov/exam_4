
import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entity/entities.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<CalendarEntities>>> getData();
}
