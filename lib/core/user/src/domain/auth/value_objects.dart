import 'package:utils/ddd.dart';

import 'value_validators.dart';

class EmailAddress extends SingleValueObject<String> {
  const EmailAddress(String value) : super(value);

  bool get isValid => validateEmailAddress(value);
}

class Password extends SingleValueObject<String> {
  const Password(String value) : super(value);

  bool get isSecure => validatePasswordSecurity(value);
}
