import 'package:CreativeFabrica/features/anonymous_sign_in/domain/entities/sign_in_response.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';

class SignInUseCase implements UseCase<SignInResponse, NoParams> {
  final SignInRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, SignInResponse>> call(NoParams params) async {
    return await repository.signIn();
  }
}
