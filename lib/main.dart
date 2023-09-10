import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/anonymous_sign_in/presentation/pages/sign_in_screen.dart';

void main() async {
  ///init injections for dependency injection
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => const SignInScreen(),
    );
  }
}


