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
      // TODO: Implementando login
      if (userType == UserType.patient) {
        context.go('/home/patient');
      } else {
        context.go('/home/professional');
      }
    }
  }

  void onForgotPasswordPressed(BuildContext context) {
    final type = userType == UserType.patient ? 'patient' : 'professional';
    context.push('/forgot-password/$type');
  }

  void onRegisterPressed(BuildContext context) {
    context.push('/register');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
