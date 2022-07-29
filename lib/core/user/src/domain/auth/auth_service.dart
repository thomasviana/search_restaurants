import 'package:dartz/dartz.dart';

import 'auth_failure.dart';
import 'user_entity.dart';
import 'value_objects.dart';

abstract class AuthService {
  Future<Either<AuthFailure, Unit>> createUserWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Stream<Option<UserEntity>> getUser();
  Future<void> logOut();
  Future<void> saveUser(UserEntity user);
}
