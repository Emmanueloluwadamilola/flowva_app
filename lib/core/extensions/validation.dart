

extension Validation on String {
String? validatePassword() {
    if (isEmpty) {
      '*required';
    }
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*_ ]+).{8,}$');
    if (regex.hasMatch(this)) {
      return null;
    }

    if (!isContainUppercase()) {
      return 'must have uppercase letters';
    }

    if (!isContainLowercase()) {
      return 'must have lowercase letters';
    }
    if (!isNumber()) {
      return 'must have digit';
    }

    if (!isSpecial()) {
      return 'must contain any of !@#\$%^&*_';
    }

    if (isValidPassword()) {
      'must be at least 8 characters';
    }

    return 'must be at least 8 characters';
  }

   bool isContainUppercase() {
    return RegExp(r'^(?=.*[A-Z]).+$').hasMatch(this);
  }

  bool isContainLowercase() {
    return RegExp(r'^(?=.*[a-z]).+$').hasMatch(this);
  }

  bool isSpecial() {
    return RegExp(r'^(?=.*[!@#$%^&*_ ]).+$').hasMatch(this);
  }

  bool isValidPassword() {
    return length > 7 && RegExp(r'^(?=.*[a-z]).+$').hasMatch(this);
  }

  bool isNumber() {
    return RegExp(r'[0-9]').hasMatch(this);
  }

    String? validateEmail() {
    if (trim().isEmpty) {
      return '*required';
    }
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(this)) {
      return null;
    }

    return 'invalid email address';
  }


}
  