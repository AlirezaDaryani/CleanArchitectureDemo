import 'package:CreativeFabrica/core/errors/failure.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/domain/entities/sign_in_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/use_cases/sign_in_usecase.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInMainEvent, SignInState> {
  final SignInUseCase useCase;

  SignInBloc({required this.useCase}) : super(SignInInitialState()) {
    on<SignInMainEvent>((event, emit) async {
      switch (event.runtimeType) {
        case SignInEvent:
          final either = await useCase(NoParams());
          either.fold((l) => handleFailure(l, emit),
              (r) => emit(SignInSuccessState(signInModel: r)));
          debugPrint('SignInEvent');
          break;
        case SignInRetryEvent:
          final either = await useCase(NoParams());
          either.fold((l) => handleFailure(l, emit),
              (r) => emit(SignInSuccessState(signInModel: r)));
          debugPrint('SignInRetry');
          break;
      }
    });
  }

  handleFailure(Failure l, Emitter<SignInState> emit) {
    switch (l.runtimeType) {
      case APIFailure:
        emit(ServerErrorState(
            message: (l as APIFailure).message, statusCode: l.statusCode));
        break;
      case InternetFailure:
        emit(InternetErrorState(
          message: (l as InternetFailure).message,
        ));
        break;
    }
  }
}
