import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../core/widgets/base_screen_layout.dart';
import 'widgets/appointment_card.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for appointments
    final appointments = [
      {
        'doctor': 'Dr. João Silva',
        'specialty': 'Psicólogo',
        'date': '15 de Março, 2024',
        'time': '14:00',
        'type': 'Consulta Online',
        'status': 'Agendado',
      },
      {
        'doctor': 'Dra. Maria Santos',
        'specialty': 'Cardiologista',
        'date': '20 de Março, 2024',
        'time': '10:00',
        'type': 'Consulta Presencial',
        'status': 'Confirmado',
      },
    ];

    return BaseScreenLayout(
      currentIndex: 1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Minhas Consultas',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: AppointmentCard(
              doctor: appointment['doctor']!,
              specialty: appointment['specialty']!,
              date: appointment['date']!,
              time: appointment['time']!,
              type: appointment['type']!,
              status: appointment['status']!,
              onTap: () {
                // Navigate to appointment details
                context.go('/appointment/${index + 1}');
              },
            ),
          );
        },
      ),
    );
  }
}
