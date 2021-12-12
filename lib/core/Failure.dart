abstract class Failure {}

class FetchFailure extends Failure {
  FetchFailure({this.message});
  final String? message;
}

class UnknownFailure extends Failure {}
