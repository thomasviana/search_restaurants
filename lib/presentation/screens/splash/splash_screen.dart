import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/auth/auth_bloc.dart';
import '../../routes/app_navigator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          AppNavigator.navigateToMainPage(context);
        } else if (state.status == AuthStatus.unauthenticated) {
          AppNavigator.navigateToAuthPage(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                strokeWidth: 3,
                // valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
