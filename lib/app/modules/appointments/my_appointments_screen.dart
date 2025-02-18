import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
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

    return Scaffold(
      backgroundColor: AppColors.background,
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
                // Already in appointments
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
}
