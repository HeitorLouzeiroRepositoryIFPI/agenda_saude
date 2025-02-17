import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum UserType {
  patient,
  professional,
}

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  UserType userType = UserType.patient;

  void setUserType(UserType type) {
    userType = type;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      // TODO: Implement login logic based on userType
      if (userType == UserType.patient) {
        // Navigate to patient home
        context.go('/home/patient');
      } else {
        // Navigate to professional home
        context.go('/home/professional');
      }
    }
  }

  void onForgotPasswordPressed(BuildContext context) {
    // TODO: Navigate to forgot password screen based on userType
    if (userType == UserType.patient) {
      context.push('/forgot-password/patient');
    } else {
      context.push('/forgot-password/professional');
    }
  }

  void onRegisterPressed(BuildContext context) {
    // TODO: Navigate to register screen based on userType
    if (userType == UserType.patient) {
      context.push('/register/patient');
    } else {
      context.push('/register/professional');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
