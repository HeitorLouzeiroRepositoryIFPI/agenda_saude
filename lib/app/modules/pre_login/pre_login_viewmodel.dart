import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreLoginViewModel extends ChangeNotifier {
  void onLoginPressed(BuildContext context) {
    context.goNamed('professionalLogin');
  }

  void onRegisterPressed(BuildContext context) {
    context.goNamed('patientLogin');
  }
}
