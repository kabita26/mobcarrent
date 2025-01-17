abstract class Failure {
  final String message;

  Failure({
    required this.message,
  });
}

//Local Database failure
class LocalDatabaseFailure extends Failure {
  LocalDatabaseFailure({
    required super.message, required statusCode,
  });
}

//Web API Failure
class WebApiFailure extends Failure {
  final int statusCode;
  WebApiFailure({
    required super.message,
    required this.statusCode,
  });
}
