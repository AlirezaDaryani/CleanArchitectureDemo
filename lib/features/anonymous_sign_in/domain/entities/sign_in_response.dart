import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SignInResponse extends Equatable {
  final String uid;

  const SignInResponse({
    required this.uid,
  });

  @override
  List<Object?> get props => [
        uid,
      ];
}
