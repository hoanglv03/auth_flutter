class Helper {
  static Function checkPhoneNumber = (String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return true;
    }
    return false;
  };
}
