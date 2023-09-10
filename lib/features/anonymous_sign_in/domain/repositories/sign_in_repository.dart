import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/sign_in_response.dart';

abstract class SignInRepository {
  Future<Either<Failure, SignInResponse>> signIn();
}
