import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/splash/splash_view.dart';
import '../../app/modules/pre_login/pre_login_view.dart';
import '../../app/modules/login/login_view.dart';
import '../../app/modules/home/patient/patient_home_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
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
      path: '/schedule',
      name: 'schedule',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Agenda')),
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
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Perfil')),
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
      path: '/search',
      name: 'search',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Buscar Profissionais')),
      ),
    ),
    GoRoute(
      path: '/categories',
      name: 'categories',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Todas as Categorias')),
      ),
    ),
    GoRoute(
      path: '/appointments',
      name: 'appointments',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Todas as Consultas')),
      ),
    ),
    GoRoute(
      path: '/appointment/:id',
      name: 'appointmentDetails',
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text('Detalhes da Consulta ${state.pathParameters['id']}'),
        ),
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
    // Auth Routes
    GoRoute(
      path: '/forgot-password/:type',
      name: 'forgotPassword',
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text('Forgot Password - ${state.pathParameters['type']}'),
        ),
      ),
    ),
    GoRoute(
      path: '/register/:type',
      name: 'register',
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text('Register - ${state.pathParameters['type']}'),
        ),
      ),
    ),
  ],
);
