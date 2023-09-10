import 'package:CreativeFabrica/core/errors/failure.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/data/data_sources/sign_in_datasource.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/domain/entities/sign_in_response.dart';
import 'package:CreativeFabrica/features/anonymous_sign_in/domain/repositories/sign_in_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource signInDataSource;
  final NetworkInfo networkInfo;

  SignInRepositoryImpl(
      {required this.networkInfo, required this.signInDataSource});

  @override
  Future<Either<Failure, SignInResponse>> signIn() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await signInDataSource.signIn();

        ///it means data is right
        return Right(response);
      } on ServerException catch (e) {
        debugPrint(e.toString());
        return Left(APIFailure(statusCode: e.statusCode));
      }
    } else {
      return const Left(InternetFailure());
    }
  }
}
