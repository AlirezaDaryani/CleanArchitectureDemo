import 'package:CreativeFabrica/core/errors/exceptions.dart';
import 'package:CreativeFabrica/core/network/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/sign_in_model.dart';

abstract class SignInDataSource {
  Future<SignInModel> signIn();
}

class SignInDataSourceImpl implements SignInDataSource {
  @override
  Future<SignInModel> signIn() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      debugPrint(userCredential.toString());
      if (userCredential.user != null) {
        return SignInModel(uid: userCredential.user!.uid);
      } else {
        throw ServerException(statusCode: 501, error: 'UID is null');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          throw ServerException(statusCode: 502, error: 'UID is null');
        default:
          print("Unknown error.");
          throw ServerException(statusCode: 503, error: 'UID is null');
      }
    } catch (e) {
      print("Unknown error. 3");
      throw ServerException(
          statusCode: 504, error: "Unknown error with sign in");
    }
  }
}
