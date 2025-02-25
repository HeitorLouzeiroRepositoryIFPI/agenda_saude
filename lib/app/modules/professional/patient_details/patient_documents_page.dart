import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../core/widgets/professional_base_screen_layout.dart';

class PatientDocumentsPage extends StatelessWidget {
  final String patientId;
  final String patientName;

  const PatientDocumentsPage({
    super.key,
    required this.patientId,
    required this.patientName,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ProfessionalBaseScreenLayout(
        currentIndex: 2,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.text),
            onPressed: () => context.go('/professional/patients'),
          ),
          title: Text(
            patientName,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Informações'),
              Tab(text: 'Arquivos'),
            ],
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
          ),
        ),
        body: TabBarView(
          children: [
            _buildInformationTab(),
            _buildDocumentsTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildInfoCard(
          title: 'Informações Pessoais',
          items: [
            InfoItem(label: 'Nome', value: patientName),
            InfoItem(label: 'Data de Nascimento', value: '15/05/1990'),
            InfoItem(label: 'CPF', value: '123.456.789-00'),
            InfoItem(label: 'Telefone', value: '(86) 99999-9999'),
          ],
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          title: 'Histórico Médico',
          items: [
            InfoItem(label: 'Alergias', value: 'Nenhuma'),
            InfoItem(label: 'Medicamentos', value: 'Nenhum'),
            InfoItem(label: 'Doenças Crônicas', value: 'Nenhuma'),
          ],
        ),
      ],
    );
  }

  Widget _buildDocumentsTab(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildDocumentCard(
              title: 'Exame de Sangue',
              date: '10/03/2024',
              type: 'PDF',
              onTap: () {
                // TODO: Open document
              },
            ),
            _buildDocumentCard(
              title: 'Raio X',
              date: '15/03/2024',
              type: 'IMG',
              onTap: () {
                // TODO: Open document
              },
            ),
          ],
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              // TODO: Add new document
            },
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<InfoItem> items,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 16),
            ...items
                .map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.label}:',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.value,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentCard({
    required String title,
    required String date,
    required String type,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  type == 'PDF' ? Icons.picture_as_pdf : Icons.image,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Adicionado em $date',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoItem {
  final String label;
  final String value;

  InfoItem({required this.label, required this.value});
}
