import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

final patientRoutes = [
  GoRoute(
    path: RoutePaths.patientHome,
    builder: (BuildContext context, GoRouterState state) {
      // TODO: Add PatientHomeView
      return const Scaffold(body: Center(child: Text('Patient Home')));
    },
    routes: [
      GoRoute(
        path: 'appointments',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add AppointmentsView
          return const Scaffold(body: Center(child: Text('Appointments')));
        },
      ),
      GoRoute(
        path: 'favorites',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add FavoritesView
          return const Scaffold(body: Center(child: Text('Favorites')));
        },
      ),
      GoRoute(
        path: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add PatientProfileView
          return const Scaffold(body: Center(child: Text('Patient Profile')));
        },
      ),
      GoRoute(
        path: 'search',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: Add SearchView
          return const Scaffold(body: Center(child: Text('Search Professionals')));
        },
      ),
    ],
  ),
];
