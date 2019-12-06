class ValidationMixin {
  String validateEmail(String value) {
    return !value.contains('@') ? "Please enter a valid email address" : null;
  }

  String validatePassword(String value) {
    return value.length < 4
        ? "Password has to be at least 4 characters long"
        : null;
  }
}
