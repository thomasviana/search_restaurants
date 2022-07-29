import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_restaurants/presentation/core/auth/auth_bloc.dart';
import 'package:search_restaurants/presentation/routes/app_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
              AppNavigator.navigateBackToAuthPage(context);
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
