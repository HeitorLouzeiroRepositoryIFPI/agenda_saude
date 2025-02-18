import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/splash/splash_view.dart';
import '../../app/modules/professional_profile/perfil_profissional_page.dart';
import '../../app/modules/pre_login/pre_login_view.dart';
import '../../app/modules/login/login_view.dart';
import '../../app/modules/home/patient/patient_home_view.dart';
import '../../app/modules/search/search_results_view.dart';
import '../../app/modules/appointment/appointment_screen.dart';
import '../../app/modules/appointment/appointment_confirmation_screen.dart';
import '../../app/modules/appointments/my_appointments_screen.dart';
import '../../app/modules/appointments/appointment_details_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    // Auth Routes
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/pre-login',
      name: 'preLogin',
      builder: (context, state) => const PreLoginView(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),

    // Patient Routes
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
      path: '/schedule',
      name: 'schedule',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Minhas Consultas')),
      ),
    ),
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Favoritos')),
      ),
    ),
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Notificações')),
      ),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Meu Perfil')),
      ),
    ),
    GoRoute(
      path: '/help',
      name: 'help',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Ajuda')),
      ),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Configurações')),
      ),
    ),
    GoRoute(
      path: '/categories',
      name: 'categories',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Categorias')),
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

    // Professional Routes
    GoRoute(
      path: '/home/professional',
      name: 'professionalHome',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Professional Home')),
      ),
    ),

    // Auth Related Routes
    GoRoute(
      path: '/forgot-password/:type',
      name: 'forgotPassword',
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text('Recuperar Senha - ${state.pathParameters['type']}'),
        ),
      ),
    ),
    GoRoute(
      path: '/register/:type',
      name: 'register',
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text('Cadastro - ${state.pathParameters['type']}'),
        ),
      ),
    ),
  ],
);
