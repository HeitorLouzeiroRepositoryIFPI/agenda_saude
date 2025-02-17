import 'package:flutter/material.dart';
import '../pre_login/pre_login_view.dart';
import '../../../main.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    _init();
  }

  Future<void> _init() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 2));
    
    // Navigate to pre-login screen
    navigateToPreLogin();
  }

  void navigateToPreLogin() {
    // Using root navigator to replace the splash screen
    Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (_) => const PreLoginView()),
    );
  }
}
