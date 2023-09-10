part of 'sign_in_bloc.dart';

@immutable
abstract class SignInMainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInEvent extends SignInMainEvent {}

class SignInRetryEvent extends SignInMainEvent {}
