import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';
import 'user_firebase_provider.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final UserFirebaseProvider _userFirebaseProvider;

  AuthServiceImpl(
    this._firebaseAuth,
    this._userFirebaseProvider,
  );

  @override
  Future<Either<AuthFailure, Unit>> createUserWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressString = emailAddress.value;
    final passwordString = password.value;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      // Seems that there is a problem with FirebaseAuthException
      switch (e.code) {
        case 'email-already-in-use':
          return left(AuthFailure.emailAlreadyInUser());
        default:
          return left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressString = emailAddress.value;
    final passwordString = password.value;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return left(AuthFailure.invalidEmailAndPasswordCombination());
        case 'user-not-found':
          return left(AuthFailure.userNotFound());
        default:
          return left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<Option<UserEntity>> getUser() {
    return _userFirebaseProvider.getUser();
  }

  @override
  Future<void> saveUser(UserEntity user) {
    return _userFirebaseProvider.saveUser(user);
  }
}
