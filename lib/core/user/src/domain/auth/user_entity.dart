import 'package:utils/ddd.dart';
import 'package:uuid/uuid.dart';

import 'value_objects.dart';

class UserEntity extends Entity<UserId> {
  final EmailAddress emailAddress;

  UserEntity({
    required UserId id,
    required this.emailAddress,
  }) : super(id);

  factory UserEntity.empty() => UserEntity(
        id: UserId.auto(),
        emailAddress: const EmailAddress(''),
      );
}

class UserId extends EntityId {
  const UserId(String value) : super(value);

  UserId.auto() : this(const Uuid().v1());
}
