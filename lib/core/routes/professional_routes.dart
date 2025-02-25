import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

final professionalRoutes = [
  GoRoute(
    path: RoutePaths.professionalHome,
    builder: (BuildContext context, GoRouterState state) {
      // TODO: Add ProfessionalHomeView
      return const Scaffold(body: Center(child: Text('Professional Home')));
    },
    routes: [
      GoRoute(
        path: 'schedule',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add ScheduleView
          return const Scaffold(body: Center(child: Text('Schedule')));
        },
      ),
      GoRoute(
        path: 'patients',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add PatientsListView
          return const Scaffold(body: Center(child: Text('Patients List')));
        },
      ),
      GoRoute(
        path: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add ProfessionalProfileView
          return const Scaffold(body: Center(child: Text('Professional Profile')));
        },
      ),
      GoRoute(
        path: 'reports',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add ReportsView
          return const Scaffold(body: Center(child: Text('Reports')));
        },
      ),
      GoRoute(
        path: 'patient/:id',
        builder: (BuildContext context, GoRouterState state) {
          final patientId = state.pathParameters['id'];
          // TODO: Add PatientDetailsView
          return Scaffold(body: Center(child: Text('Patient Details: $patientId')));
        },
      ),
    ],
  ),
];
