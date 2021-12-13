abstract class Failure {}

class FetchFailure extends Failure {
  FetchFailure({this.message});
  final String? message;
}

class StorageFailure extends Failure {}

class UnknownFailure extends Failure {}
