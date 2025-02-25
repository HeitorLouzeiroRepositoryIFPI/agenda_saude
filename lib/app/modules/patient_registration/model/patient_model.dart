class PatientModel {
  final String name;
  final String email;
  final String cpf;
  final String phone;
  final String password;

  PatientModel({
    required this.name,
    required this.email,
    required this.cpf,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'cpf': cpf,
      'phone': phone,
      'password': password,
    };
  }

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name'] as String,
      email: json['email'] as String,
      cpf: json['cpf'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );
  }

  @override
  String toString() {
    return 'PatientModel(name: $name, email: $email, cpf: $cpf, phone: $phone)';
  }
}
