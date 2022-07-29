bool validateEmailAddress(String input) {
  const emailRegex = r'(^[\w\._+-]{1,}(\+[\w]{1,})?@[\w\.\-]{3,}.\w{2,5}$)';
  return RegExp(emailRegex).hasMatch(input);
}

bool validatePasswordSecurity(String input) {
  return input.length >= 6;
}

bool validatePasswordMatch(
  String password,
  String confirmation,
) {
  return password == confirmation;
}
