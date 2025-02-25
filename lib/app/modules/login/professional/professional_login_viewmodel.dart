import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfessionalLoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  bool validateAndSave() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      // TODO: Implement login logic
      return true;
    }
    return false;
  }

  void onForgotPasswordPressed(BuildContext context) {
    // TODO: Navigate to forgot password screen
    // context.pushNamed('forgotPassword');
  }

  void onRegisterPressed(BuildContext context) {
    // TODO: Navigate to register screen
    // context.pushNamed('professionalRegister');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
