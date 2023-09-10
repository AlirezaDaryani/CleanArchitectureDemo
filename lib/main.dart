import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/anonymous_sign_in/presentation/manager/sign_in_bloc.dart';
import 'features/anonymous_sign_in/presentation/pages/sign_in_screen.dart';
import 'injection.dart';

void main() async {
  ///init injections for dependency injection
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<SignInBloc>(
          create: (_) => serviceLocator<SignInBloc>()..add(SignInEvent()),
          child: const SignInScreen()),
    );
  }
}
