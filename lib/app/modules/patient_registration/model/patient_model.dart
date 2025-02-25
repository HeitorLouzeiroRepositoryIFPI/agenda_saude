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
      name: json['name'],
      email: json['email'],
      cpf: json['cpf'],
      phone: json['phone'],
      password: json['password'],
    );
  }
}
