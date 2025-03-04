import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../../app/modules/professional_profile/perfil_profissional_page.dart';
import '../../app/modules/home/patient/patient_home_view.dart';
import '../../app/modules/search/search_results_view.dart';
import '../../app/modules/appointment/appointment_screen.dart';
import '../../app/modules/appointment/appointment_confirmation_screen.dart';
import '../../app/modules/appointments/my_appointments_screen.dart';
import '../../app/modules/appointments/appointment_details_screen.dart';
import '../../app/core/widgets/base_screen_layout.dart';
import '../../app/modules/favorites/favorites_page.dart';
import '../../app/modules/home/patient/profile/profile_edit_view.dart';

final List<GoRoute> patientRoutes = [
  GoRoute(
    path: '/home/patient',
    name: 'patientHome',
    builder: (context, state) => const PatientHomeView(),
  ),
  GoRoute(
    path: '/search',
    name: 'searchResults',
    builder: (context, state) => const SearchResultsView(),
  ),
  GoRoute(
    path: '/doctor/:id',
    name: 'doctorProfile',
    builder: (context, state) => const PerfilProfissionalPage(),
  ),
  GoRoute(
    path: '/notifications',
    name: 'notifications',
    builder: (context, state) => BaseScreenLayout(
      currentIndex: -1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Notificações',
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
      body: const Center(child: Text('Notificações')),
    ),
  ),
  GoRoute(
    path: '/profile',
    name: 'profile',
    builder: (context, state) => BaseScreenLayout(
      currentIndex: 3,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Perfil',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const ProfileEditView(),
    ),
  ),
  GoRoute(
    path: '/receipts',
    name: 'receipts',
    builder: (context, state) => BaseScreenLayout(
      currentIndex: -1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Recibos de Pagamento',
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
      body: const Center(child: Text('Recibos de Pagamento')),
    ),
  ),
  GoRoute(
    path: '/prescriptions',
    name: 'prescriptions',
    builder: (context, state) => BaseScreenLayout(
      currentIndex: -1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Minhas Receitas',
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
      body: const Center(child: Text('Minhas Receitas')),
    ),
  ),
  GoRoute(
    path: '/exams',
    name: 'exams',
    builder: (context, state) => BaseScreenLayout(
      currentIndex: -1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Exames Solicitados',
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
      body: const Center(child: Text('Exames Solicitados')),
    ),
  ),
  GoRoute(
    path: '/favorites',
    name: 'favorites',
    builder: (context, state) => const BaseScreenLayout(
      currentIndex: 2,
      body: FavoritesPage(),
    ),
  ),
  GoRoute(
    path: '/help',
    name: 'help',
    builder: (context, state) => BaseScreenLayout(
      currentIndex: -1,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Ajuda',
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
      body: const Center(child: Text('Ajuda')),
    ),
  ),
  GoRoute(
    path: '/appointments',
    name: 'appointments',
    builder: (context, state) => const MyAppointmentsScreen(),
  ),
  GoRoute(
    path: '/schedule-appointment/:doctorId',
    name: 'scheduleAppointment',
    builder: (context, state) => const AppointmentScreen(),
  ),
  GoRoute(
    path: '/appointment-confirmation',
    name: 'appointmentConfirmation',
    builder: (context, state) => const AppointmentConfirmationScreen(),
  ),
  GoRoute(
    path: '/appointment/:id',
    name: 'appointmentDetails',
    builder: (context, state) => AppointmentDetailsScreen(
      id: state.pathParameters['id']!,
    ),
  ),
];
