class ValidationMixin {
  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'Please enter a valid email';
    }
    return '';
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return 'Password must be at least 4 characters';
    }
    return '';
  }
}
