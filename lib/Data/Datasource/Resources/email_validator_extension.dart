extension EmailValidator on String {
  static String? validatorPassword(v) {
    if (v.trim().isEmpty) {
      return "Please provide password";
    } else if (v.length < 8) {
      return "Password should be 8 digits";
    }

    return null;
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
