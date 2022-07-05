abstract class Failure {
  final List<dynamic> properties;
  const Failure({this.properties = const <dynamic>[]});
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
