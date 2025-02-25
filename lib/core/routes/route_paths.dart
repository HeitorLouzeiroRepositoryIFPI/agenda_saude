class RoutePaths {
  // Auth Routes
  static const String root = '/';
  static const String login = '/login';
  static const String patientRegistration = '/patient-registration';

  // Patient Routes
  static const String patientHome = '/patient';
  static const String patientAppointments = '/patient/appointments';
  static const String patientFavorites = '/patient/favorites';
  static const String patientProfile = '/patient/profile';
  static const String patientSearch = '/patient/search';

  // Professional Routes
  static const String professionalHome = '/professional';
  static const String professionalSchedule = '/professional/schedule';
  static const String professionalPatients = '/professional/patients';
  static const String professionalProfile = '/professional/profile';
  static const String professionalReports = '/professional/reports';
  static const String professionalPatientDetails = '/professional/patient/:id';
}
