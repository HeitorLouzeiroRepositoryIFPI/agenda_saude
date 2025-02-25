import 'package:flutter/material.dart';
import '../model/patient_model.dart';
import '../repository/patient_repository.dart';

class PatientRegistrationViewModel extends ChangeNotifier {
  final _repository = PatientRepository();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu CPF';
    }
    if (value.length != 11) {
      return 'CPF deve ter 11 dígitos';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu telefone';
    }
    if (value.length < 10) {
      return 'Telefone deve ter no mínimo 10 dígitos';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme sua senha';
    }
    if (value != passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  Future<bool> registerPatient() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    try {
      setLoading(true);
      setErrorMessage(null);

      final patient = PatientModel(
        name: nameController.text,
        email: emailController.text,
        cpf: cpfController.text.replaceAll(RegExp(r'[^\d]'), ''),
        phone: phoneController.text.replaceAll(RegExp(r'[^\d]'), ''),
        password: passwordController.text,
      );

      final success = await _repository.registerPatient(patient);
      return success;
    } catch (e) {
      setErrorMessage('Erro ao cadastrar paciente: $e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    cpfController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
