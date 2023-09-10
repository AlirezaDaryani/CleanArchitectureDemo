part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class ServerErrorState extends SignInState {
  final String message;
  final int statusCode;

  ServerErrorState({required this.message, required this.statusCode});
}

class InternetErrorState extends SignInState {
  final String message;

  InternetErrorState({required this.message});
}

class SignInSuccessState extends SignInState {
  final SignInResponse signInModel;

  SignInSuccessState({required this.signInModel});
}
