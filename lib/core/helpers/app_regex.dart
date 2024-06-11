class AppRegex{
  static bool isEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isPassword(String password) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$').hasMatch(password);
  }
  static bool hasLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }
  static bool hasUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }
  static bool isPhoneNumber(String phone) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phone);
  }
  static bool hasNumbers(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }
  static bool hasSpecialCharacters(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
  static bool hasMinLength(String password) {
    return password.length >= 8;
  }


}