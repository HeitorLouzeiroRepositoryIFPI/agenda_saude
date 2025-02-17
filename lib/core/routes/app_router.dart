import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/splash/splash_view.dart';
import '../../app/modules/pre_login/pre_login_view.dart';
import '../../app/modules/login/login_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/', // Changed to start with splash screen
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
    // TODO: Add routes for home screens, forgot password, and registration
    GoRoute(
      path: '/home/patient',
      name: 'patientHome',
      builder: (context, state) => const Scaffold(body: Center(child: Text('Patient Home'))),
    ),
    GoRoute(
      path: '/home/professional',
      name: 'professionalHome',
      builder: (context, state) => const Scaffold(body: Center(child: Text('Professional Home'))),
    ),
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
