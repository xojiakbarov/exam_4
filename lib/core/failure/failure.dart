abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  final String code;

  const ServerFailure({
    this.message = '',
    this.code = '',
  });
}

class CacheFailure extends Failure {
  final String message;
  final int code;

  const CacheFailure({
    this.message = '',
    this.code = 0,
  });
}
