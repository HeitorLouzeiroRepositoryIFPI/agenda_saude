import 'package:flutter/material.dart';
import 'package:agenda_saude/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.primary.withOpacity(0.8),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.white.withOpacity(0.2),
                      child: const Icon(
                        Icons.person_outline,
                        color: AppColors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'João Silva',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'joao.silva@email.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  icon: Icons.receipt_long_outlined,
                  title: 'Recibos de Pagamento',
                  onTap: () => context.go('/receipts'),
                ),
                _buildMenuItem(
                  icon: Icons.medical_information_outlined,
                  title: 'Minhas Receitas',
                  onTap: () => context.go('/prescriptions'),
                ),
                _buildMenuItem(
                  icon: Icons.assignment_outlined,
                  title: 'Exames Solicitados',
                  onTap: () => context.go('/exams'),
                ),
                _buildMenuItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notificações',
                  onTap: () => context.go('/notifications'),
                ),
                const Divider(height: 1),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'Ajuda',
                  onTap: () => context.go('/help'),
                ),
                _buildMenuItem(
                  icon: Icons.exit_to_app,
                  title: 'Sair',
                  onTap: () => context.go('/login'),
                  textColor: AppColors.error,
                  iconColor: AppColors.error,
                ),
              ],
            ),
          ),
          // Version
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Versão 1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? AppColors.textSecondary,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? AppColors.text,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      minLeadingWidth: 24,
      horizontalTitleGap: 12,
    );
  }
}
