import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PatientLoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> onLoginPressed(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha todos os campos'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setLoading(true);

    try {
      // TODO: Implement login logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Navigate to home screen on success
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeView()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer login: ${e.toString()}'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      setLoading(false);
    }
  }

  void onForgotPasswordPressed() {
    // TODO: Implement forgot password logic
  }

  void onRegisterPressed(BuildContext context) {
    // TODO: Navigate to register screen
    // Navigator.push(context, MaterialPageRoute(builder: (_) => PatientRegisterView()));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
