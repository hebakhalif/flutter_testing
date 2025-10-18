// lib/validators.dart

class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return 'Password cannot be empty';
    if (password.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Password must contain at least one uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(password)) return 'Password must contain at least one lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(password)) return 'Password must contain at least one number';
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) return 'Password must contain at least one special character';
    return null;
  }

  static String? validateConfirmPassword(String? pass, String? confirmPass) {
    if (pass == null || confirmPass == null) return 'Confirm password required';
    if (pass != confirmPass) return 'Passwords do not match';
    return null;
}
}