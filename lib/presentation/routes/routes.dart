import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_restaurants/di/dependency_injection.dart';
import 'package:search_restaurants/presentation/screens/auth/auth_screen.dart';
import 'package:search_restaurants/presentation/screens/auth/cubit/auth_screen_cubit.dart';
import 'package:search_restaurants/presentation/screens/main/main_app_cubit/main_screen_cubit.dart';
import 'package:search_restaurants/presentation/screens/main/main_app_screen.dart';
import 'package:search_restaurants/presentation/screens/splash/splash_screen.dart';

import 'app_navigator.dart';

class AppRouter {
  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case AppNavigator.ROUTE_SPLASH_SCREEN:
        return _buildRoute(
          settings,
          SplashScreen(),
        );
      case AppNavigator.ROUTE_AUTH_SCREEN:
        return _buildRoute(
          settings,
          BlocProvider(
            create: (context) => sl<AuthScreenCubit>(),
            child: const AuthScreen(),
          ),
        );
      case AppNavigator.ROUTE_MAIN_SCREEN:
        return _buildRoute(
          settings,
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<MainScreenCubit>(),
              ),
            ],
            child: const MainAppScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings,
    Widget screen,
  ) =>
      MaterialPageRoute(settings: settings, builder: (context) => screen);
}
