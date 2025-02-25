import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/pre_login/pre_login_view.dart';
import '../../app/modules/patient_registration/view/patient_registration_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const PreLoginView();
      },
    ),
    GoRoute(
      path: '/patient-registration',
      builder: (BuildContext context, GoRouterState state) {
        return const PatientRegistrationView();
      },
    ),
  ],
);
