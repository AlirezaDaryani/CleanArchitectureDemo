import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  const Failure({this.properties = const <dynamic>[]});

  @override
  List<Object?> get props => [properties];
}

class APIFailure extends Failure {
  final String message;
  final int statusCode;

  const APIFailure(
      {this.message = 'Something went wrong, Try again later : ',
      required this.statusCode});
}

class InternetFailure extends Failure {
  final String message;

  const InternetFailure({this.message = 'There is not internet connection'});
}
