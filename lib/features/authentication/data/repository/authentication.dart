
import '../../../../core/either/either.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/authenticated_user.dart';
import '../../domain/repository/authentication.dart';
import '../data_source/remote.dart';
import '../models/authenticated_user.dart';

class AuthenticationUserRepositoryImpl implements AuthenticationUserRepository {
  final AuthenticationRemoteDataSource _dataSource;

  const AuthenticationUserRepositoryImpl(
      {required AuthenticationRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthenticationUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: error.errorMessage, code: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.login(email, password);
      return Right(AuthenticationUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: error.errorMessage, code: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await _dataSource.logout();
      return Right(response);
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: error.errorMessage, code: error.errorCode));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> signUp(
      String email, String password) async {
    try {
      final user = await _dataSource.signUp(email, password);
      return Right(AuthenticationUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(
          ServerFailure(message: error.errorMessage, code: error.errorCode));
    }
  }
}
