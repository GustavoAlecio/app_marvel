import 'failure.dart';

class ConnectionError extends Failure {
  @override
  final String message;
  ConnectionError({required this.message});
}

class QueryError extends Failure {
  @override
  final String message;
  QueryError({required this.message});
}


