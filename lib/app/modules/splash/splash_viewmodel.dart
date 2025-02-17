import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pre_login/pre_login_view.dart';
import '../../../main.dart';

class SplashViewModel extends ChangeNotifier {
  late BuildContext context;

  SplashViewModel(this.context) {
    _init();
  }

  Future<void> _init() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 2));
    
    // Navigate to pre-login screen
    navigateToPreLogin();
  }

  void navigateToPreLogin() {
    // Using GoRouter to navigate to pre-login
    context.goNamed('preLogin');
  }
}
