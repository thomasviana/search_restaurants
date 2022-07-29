import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_restaurants/di/dependency_injection.dart';
import 'package:search_restaurants/presentation/core/auth/auth_bloc.dart';
import 'package:search_restaurants/presentation/routes/routes.dart';
import 'package:search_restaurants/presentation/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();
  final _authBloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc..add(AuthStatusRequested()),
      child: MaterialApp(
        title: 'Search Restaurants',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: WillPopScope(
          child: Navigator(
            key: _navigatorKey,
            onGenerateRoute: _appRouter.routes,
          ),
          onWillPop: () async => _navigatorKey.currentState!.maybePop(),
        ),
      ),
    );
  }
}
