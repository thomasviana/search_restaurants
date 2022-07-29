import '../../../domain.dart';

class UserEntityDTO {
  final String? id;
  final String? emailAddress;

  UserEntityDTO({
    this.id,
    this.emailAddress,
  });

  factory UserEntityDTO.fromDomain(UserEntity userEntity) {
    return UserEntityDTO(
      id: userEntity.id.value,
      emailAddress: userEntity.emailAddress.value,
    );
  }

  UserEntity toDomain() {
    return UserEntity(
      id: UserId(id!),
      emailAddress: EmailAddress(emailAddress!),
    );
  }

  factory UserEntityDTO.fromFirebaseMap(Map<String?, Object?> data) {
    return UserEntityDTO(
      id: data['id']! as String,
      emailAddress: data['email']! as String,
    );
  }

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'email': emailAddress,
    };
  }
}
