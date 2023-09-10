import 'dart:async';

import 'package:CreativeFabrica/features/anonymous_sign_in/presentation/manager/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/pages/home_screen.dart';

///A screen that show loading and screens for automatic sign-in feature with Firebase
///Screen will change after sign-in complete
///Screen will remove from the widget stack after sign-in
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            debugPrint(state.runtimeType.toString());
            if (state is SignInSuccessState) {
              Timer(const Duration(seconds: 2), () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/nasa_logo.jpg',
                  ),
                ),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  switch (state.runtimeType) {
                    case ServerErrorState:
                      return Column(
                        children: [
                          Text(
                              '${(state as ServerErrorState).message}\n${(state).statusCode}'),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<SignInBloc>(context)
                                    .add(SignInRetryEvent());
                              },
                              child: const Text('Retry'))
                        ],
                      );
                    case InternetErrorState:
                      return Column(
                        children: [
                          Text((state as InternetErrorState).message),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<SignInBloc>(context)
                                    .add(SignInRetryEvent());
                              },
                              child: const Text('Retry'))
                        ],
                      );
                  }
                  return const SizedBox(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
