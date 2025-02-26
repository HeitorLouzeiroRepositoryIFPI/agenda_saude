import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_routes.dart';
import 'patient_routes.dart';
import 'professional_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    // Combinando todas as rotas
    ...authRoutes,
    ...patientRoutes,
    ...professionalRoutes,
  ],
);
