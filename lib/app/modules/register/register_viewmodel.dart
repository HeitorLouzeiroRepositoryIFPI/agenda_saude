import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String cpf = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail é obrigatório';
    }
    if (!value.contains('@')) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório';
    }
    if (value.length != 11) {
      return 'CPF inválido';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefone é obrigatório';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 6) {
      return 'Senha deve ter no mínimo 6 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirmação de senha é obrigatória';
    }
    if (value != password) {
      return 'Senhas não conferem';
    }
    return null;
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();

    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implementar registro no backend
      await Future.delayed(const Duration(seconds: 2)); // Simulação

      // Sucesso
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
