class AuthFailure {
  final bool? isCanceledByUser;
  final bool? isServerError;
  final bool? isUserNotFound;
  final bool? isEmailAlreadyInUse;
  final bool? isInvalidEmailAndPasswordCombination;

  AuthFailure({
    this.isCanceledByUser,
    this.isServerError,
    this.isUserNotFound,
    this.isEmailAlreadyInUse,
    this.isInvalidEmailAndPasswordCombination,
  });

  factory AuthFailure.cancelledByUser() => AuthFailure(isCanceledByUser: true);
  factory AuthFailure.serverError() => AuthFailure(isServerError: true);
  factory AuthFailure.userNotFound() => AuthFailure(isUserNotFound: true);
  factory AuthFailure.emailAlreadyInUser() =>
      AuthFailure(isEmailAlreadyInUse: true);
  factory AuthFailure.invalidEmailAndPasswordCombination() =>
      AuthFailure(isInvalidEmailAndPasswordCombination: true);

  String map({
    required String Function() cancelledByUser,
    required String Function() serverError,
    required String Function() userNotFound,
    required String Function() emailAlreadyInUser,
    required String Function() invalidEmailAndPasswordCombination,
  }) =>
      throw Error;

  AuthFailure copyWith({
    bool? isCanceledByUser,
    bool? isServerError,
    bool? isUserNotFound,
    bool? isEmailAlreadyInUse,
    bool? isInvalidEmailAndPasswordCombination,
  }) {
    return AuthFailure(
      isCanceledByUser: isCanceledByUser ?? this.isCanceledByUser,
      isServerError: isServerError ?? this.isServerError,
      isUserNotFound: isUserNotFound ?? this.isUserNotFound,
      isEmailAlreadyInUse: isEmailAlreadyInUse ?? this.isEmailAlreadyInUse,
      isInvalidEmailAndPasswordCombination:
          isInvalidEmailAndPasswordCombination ??
              this.isInvalidEmailAndPasswordCombination,
    );
  }
}
