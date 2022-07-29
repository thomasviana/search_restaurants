import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';
import 'user_entity_dto.dart';

@lazySingleton
class UserFirebaseProvider {
  final FirebaseFirestore _firebaseFirestore;

  UserFirebaseProvider(
    this._firebaseFirestore,
  );

  User? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Not authenticated exception.');
    return user;
  }

  Stream<Option<UserEntity>> getUser() async* {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      yield const None();
    } else {
      yield* _firebaseFirestore
          .doc('users/${user.uid}')
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists) {
          final userData = UserEntityDTO.fromFirebaseMap(snapshot.data()!);
          final userEntity = userData.toDomain();
          return Some(userEntity);
        } else {
          final registeredUser = _userFromFirebase(user);
          return Some(registeredUser);
        }
      });
    }
  }

  UserEntity _userFromFirebase(User user) {
    return UserEntity(
      id: UserId(user.uid),
      emailAddress: EmailAddress(user.email!),
    );
  }

  Future<void> saveUser(UserEntity user) async {
    final ref = _firebaseFirestore.doc('users/${currentUser!.uid}');
    final userDTO = UserEntityDTO.fromDomain(user);
    await ref.set(userDTO.toFirebaseMap(), SetOptions(merge: true));
  }
}
