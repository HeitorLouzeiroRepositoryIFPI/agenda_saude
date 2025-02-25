import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_routes.dart';
import 'patient_routes.dart';
import 'professional_routes.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    ...authRoutes,
    ...patientRoutes,
    ...professionalRoutes,
  ],
  errorBuilder: (context, state) => Material(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Página não encontrada',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Voltar ao início'),
          ),
        ],
      ),
    ),
  ),
  redirect: (BuildContext context, GoRouterState state) {
    // TODO: Implement authentication redirects
    return null;
  },
);
