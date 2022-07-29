import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_restaurants/presentation/resources/widgets/rounded_button.dart';
import 'package:search_restaurants/presentation/routes/app_navigator.dart';
import 'package:search_restaurants/presentation/theme/theme.dart';

import 'components/auth_form.dart';
import 'cubit/auth_screen_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthScreenCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthScreenCubit>();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> trySubmit() async {
      if (cubit.state.isCreateAccountMode) {
        await cubit.onCreateUserWithEmailAndPassword();
      } else {
        await cubit.onSignInWithEmailAndPassword();
      }
    }

    return Scaffold(
      body: BlocConsumer<AuthScreenCubit, AuthScreenState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () => {},
            (either) => either.fold(
              (failure) => {
                FlushbarHelper.createError(
                  message: failure.map(
                    cancelledByUser: () => 'Canceled by user',
                    serverError: () => 'Server error',
                    userNotFound: () => 'User not found',
                    emailAlreadyInUser: () => 'Email already in use',
                    invalidEmailAndPasswordCombination: () =>
                        'Invalid email and password combination',
                  ),
                ).show(context)
              },
              (_) => {
                AppNavigator.navigateToMainPage(context),
              },
            ),
          );
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    const Icon(Icons.restaurant_rounded, size: 100),
                    const SizedBox(height: 50),
                    Text(
                      state.isCreateAccountMode ? 'Register' : 'Login',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 16),
                    AuthForm(
                      state: state,
                      enabled: !state.isSubmitting,
                      errorEnabled: state.showErrorMessages,
                      isCreateAccountMode: state.isCreateAccountMode,
                      onEmailChanged: (email) => cubit.onEmailChanged(email),
                      onPasswordChanged: (password) =>
                          cubit.onPasswordChanged(password),
                      onConfirmationPasswordChanged: (confirmationPassword) =>
                          cubit.onConfirmationPasswordChanged(
                        confirmationPassword,
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (state.isSubmitting)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (!state.isSubmitting)
                      RoundedButton(
                        label: state.isCreateAccountMode
                            ? 'Create account'
                            : 'Login',
                        isEnabled: true,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          trySubmit();
                        },
                      ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.onAuthModeChanged();
                      },
                      child: Text(
                        state.isCreateAccountMode
                            ? 'Already have an account? Login'
                            : 'Create an account',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const LoginButton({
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}
