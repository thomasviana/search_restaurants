// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

class AppNavigator {
  static const ROUTE_SPLASH_SCREEN = Navigator.defaultRouteName;
  static const ROUTE_AUTH_SCREEN = '/auth';
  static const ROUTE_MAIN_SCREEN = '/main';

  static void navigateBack(BuildContext context) => Navigator.pop(context);

  static void navigateToAuthPage(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_AUTH_SCREEN);
  }

  static void navigateBackToAuthPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      ROUTE_AUTH_SCREEN,
      (route) => false,
    );
  }

  static void navigateToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      ROUTE_MAIN_SCREEN,
      (route) => false,
    );
  }

  static void navigateBackToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      ROUTE_MAIN_SCREEN,
      (route) => false,
    );
  }
}
