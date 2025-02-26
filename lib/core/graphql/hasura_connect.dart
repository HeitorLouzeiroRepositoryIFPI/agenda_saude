import 'package:hasura_connect/hasura_connect.dart';

class HasuraConfig {
  static HasuraConnect get instance => _instance;
  static late HasuraConnect _instance;

  static void initialize() {
    _instance = HasuraConnect(
      'http://localhost:8080/v1/graphql',
      headers: {
        'x-hasura-admin-secret': 'rWZBx72FM3Cb6nY7QLTt2X7wDqgWDYC8aoTIa1CUHYHmaL70Tm3aik9WY96ornNL',
      },
    );
  }
}
