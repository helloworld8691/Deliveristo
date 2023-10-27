abstract class Failure implements Exception {
  final String errorMsg;
  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(String errorMsg): super(errorMsg);
}