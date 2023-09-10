import 'package:CreativeFabrica/features/anonymous_sign_in/domain/entities/sign_in_response.dart';

class SignInModel extends SignInResponse {
  const SignInModel({required super.uid});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(uid: json['uid']);
  }
}
