import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

@injectable
class SignIn {
  final AuthService _authService;
  SignIn(
    this._authService,
  );

  Future<Either<AuthFailure, Unit>> withEmailAndPassword(
    EmailAddress email,
    Password password,
  ) =>
      _authService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
}
