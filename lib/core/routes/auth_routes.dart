import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/pre_login/pre_login_view.dart';
import '../../app/modules/patient_registration/view/patient_registration_view.dart';
import 'route_paths.dart';

final authRoutes = [
  GoRoute(
    path: RoutePaths.root,
    builder: (BuildContext context, GoRouterState state) {
      return const PreLoginView();
    },
  ),
  GoRoute(
    path: RoutePaths.patientRegistration,
    builder: (BuildContext context, GoRouterState state) {
      return const PatientRegistrationView();
    },
  ),
  GoRoute(
    path: RoutePaths.login,
    builder: (BuildContext context, GoRouterState state) {
      // TODO: Add LoginView
      return const Scaffold(body: Center(child: Text('Login')));
    },
  ),
];
