import 'package:hasura_connect/hasura_connect.dart';
import '../model/patient_model.dart';
import '../../../../core/graphql/hasura_connect.dart';

/// Repositório responsável por gerenciar as operações de banco de dados relacionadas aos pacientes
class PatientRepository {
  // Instância do HasuraConnect para fazer as requisições GraphQL
  final HasuraConnect _hasuraConnect = HasuraConfig.instance;

  /// Método para registrar um novo paciente no banco de dados
  ///
  /// Recebe um [PatientModel] contendo os dados do paciente
  /// Retorna [Future<bool>] indicando se o cadastro foi bem sucedido
  Future<bool> registerPatient(PatientModel patient) async {
    // Mutation GraphQL para inserir um novo paciente
    // A mutation é executada no schema 'clinica' na tabela 'pacientes'
    const String mutation = '''
      mutation CadastrarPaciente(
        \$nome: String!,     # Nome do paciente
        \$email: String!,    # Email do paciente (único)
        \$cpf: String!,      # CPF do paciente (único)
        \$telefone: String!, # Telefone do paciente
        \$senha: String!     # Senha do paciente
      ) {
        # Insere um novo registro na tabela clinica.pacientes
        insert_clinica_pacientes_one(object: {
          nome: \$nome,
          email: \$email,
          cpf: \$cpf,
          telefone: \$telefone,
          senha: \$senha
        }) {
          # Campos retornados após a inserção
          id        # UUID gerado automaticamente
          nome      # Nome do paciente inserido
          email     # Email do paciente inserido
        }
      }
    ''';

    try {
      // Executa a mutation no Hasura
      final response = await _hasuraConnect.mutation(
        mutation,
        variables: {
          // Mapeia os dados do modelo para as variáveis da mutation
          'nome': patient.name,
          'email': patient.email,
          'cpf': patient.cpf,
          'telefone': patient.phone,
          'senha': patient.password,
        },
      );

      // Verifica se a resposta tem a estrutura esperada
      if (response is Map<String, dynamic> && response.containsKey('data') && response['data'] != null && response['data']['insert_clinica_pacientes_one'] != null) {
        return true; // Cadastro realizado com sucesso
      }

      // Log para debug da resposta
      print('Resposta do Hasura: $response');
      return false; // Falha no cadastro
    } catch (e) {
      // Log para debug de erros
      print('Erro detalhado: $e');
      // Lança uma exceção com mensagem amigável
      throw Exception('Erro ao cadastrar paciente: $e');
    }
  }
}
