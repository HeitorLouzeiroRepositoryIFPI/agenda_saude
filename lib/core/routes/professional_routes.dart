import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/home/professional/professional_home_page.dart';
import '../../app/modules/professional/schedule/professional_schedule_page.dart';
import '../../app/modules/professional/patients/professional_patients_page.dart';
import '../../app/modules/professional/patient_details/patient_documents_page.dart';
import '../../app/modules/professional/profile/professional_profile_page.dart';
import '../../app/modules/professional/reports/professional_reports_page.dart';
import '../../app/modules/professional/send_link/send_link_page.dart';

final List<GoRoute> professionalRoutes = [
  GoRoute(
    path: '/home/professional',
    name: 'professionalHome',
    builder: (context, state) => const ProfessionalHomePage(),
  ),
  GoRoute(
    path: '/professional/schedule',
    name: 'professionalSchedule',
    builder: (context, state) => const ProfessionalSchedulePage(),
  ),
  GoRoute(
    path: '/professional/patients',
    name: 'professionalPatients',
    builder: (context, state) => const ProfessionalPatientsPage(),
  ),
  GoRoute(
    path: '/professional/patient/:id',
    name: 'patientDocuments',
    builder: (context, state) => PatientDocumentsPage(
      patientId: state.pathParameters['id'] ?? '',
      patientName: state.extra as String? ?? 'Paciente',
    ),
  ),
  GoRoute(
    path: '/professional/profile',
    name: 'professionalProfile',
    builder: (context, state) => const ProfessionalProfilePage(),
  ),
  GoRoute(
    path: '/professional/reports',
    name: 'professionalReports',
    builder: (context, state) => const ProfessionalReportsPage(),
  ),
  GoRoute(
    path: '/professional/send-link',
    name: 'sendLink',
    builder: (context, state) => const SendLinkPage(),
  ),
];
