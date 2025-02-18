import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final String id;

  const AppointmentDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // Dummy data for the appointment details
    final appointment = {
      'doctor': 'Dr. João Silva',
      'specialty': 'Psicólogo',
      'date': '15 de Março, 2024',
      'time': '14:00',
      'type': 'Consulta Online',
      'status': 'Agendado',
      'location': 'Via Google Meet',
      'notes': 'Trazer exames anteriores se houver.',
    };

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Detalhes da Consulta',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Professional Info Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.1),
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment['doctor']!,
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appointment['specialty']!,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Appointment Details
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações da Consulta',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    Icons.calendar_today,
                    'Data',
                    appointment['date']!,
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    Icons.access_time,
                    'Horário',
                    appointment['time']!,
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    appointment['type']!.toLowerCase().contains('online') ? Icons.videocam : Icons.location_on,
                    'Tipo',
                    appointment['type']!,
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    Icons.location_on,
                    'Local',
                    appointment['location']!,
                  ),
                  if (appointment['notes'] != null) ...[
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Text(
                      'Observações',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      appointment['notes']!,
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle rescheduling
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Remarcar'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle cancellation
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: AppColors.error),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 1, // Schedule tab
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/home/patient');
                break;
              case 1:
                context.go('/appointments');
                break;
              case 2:
                context.go('/favorites');
                break;
              case 3:
                context.go('/profile');
                break;
            }
          },
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today),
              label: 'Agenda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: AppColors.text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
