import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientHomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  // Mock user data
  final Map<String, dynamic> userData = {
    'name': 'João Silva',
    'email': 'joao.silva@email.com',
    'profileImage': null, // URL for profile image if available
  };

  // Mock data for categories
  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.medical_services_outlined,
      'title': 'Clínico Geral',
    },
    {
      'icon': Icons.psychology_outlined,
      'title': 'Psicólogo',
    },
    {
      'icon': Icons.medication_outlined,
      'title': 'Cardiologista',
    },
    {
      'icon': Icons.healing_outlined,
      'title': 'Ortopedista',
    },
    {
      'icon': Icons.visibility_outlined,
      'title': 'Oftalmologista',
    },
  ];

  // Mock data for appointments
  final List<Map<String, dynamic>> appointments = [
    {
      'doctorName': 'Dra. Maria Silva',
      'specialty': 'Clínico Geral',
      'date': '24 Mar, 2024',
      'time': '14:30',
      'status': 'confirmed',
      'location': 'Clínica Central',
    },
    {
      'doctorName': 'Dr. Carlos Santos',
      'specialty': 'Cardiologista',
      'date': '26 Mar, 2024',
      'time': '10:00',
      'status': 'pending',
      'location': 'Hospital São Lucas',
    },
  ];

  // Navigation methods
  void onCategoryTap(int index) {
    final category = categories[index];
    debugPrint('Selected category: ${category['title']}');
  }

  void onAppointmentTap(int index) {
    final appointment = appointments[index];
    debugPrint('Selected appointment: ${appointment['doctorName']}');
  }

  void onNotificationsTap() {
    debugPrint('Opening notifications');
  }

  void onSearchTap() {
    debugPrint('Opening search');
  }

  void onViewAllCategories() {
    debugPrint('Opening all categories');
  }

  void onViewAllAppointments() {
    debugPrint('Opening all appointments');
  }

  // Drawer navigation methods
  void navigateToProfile(BuildContext context) {
    context.go('/profile');
  }

  void navigateToAppointments(BuildContext context) {
    context.go('/schedule');
  }

  void navigateToFavorites(BuildContext context) {
    context.go('/favorites');
  }

  void navigateToNotifications(BuildContext context) {
    context.go('/notifications');
  }

  void navigateToHelp(BuildContext context) {
    context.go('/help');
  }

  void navigateToSettings(BuildContext context) {
    context.go('/settings');
  }

  void logout(BuildContext context) {
    // TODO: Implement proper logout logic
    context.go('/login');
  }

  // Bottom navigation methods
  void handleBottomNavigation(BuildContext context, int index) {
    switch (index) {
      case 0: // Home
        context.go('/home/patient');
        break;
      case 1: // Schedule
        context.go('/schedule');
        break;
      case 2: // Favorites
        context.go('/favorites');
        break;
      case 3: // Profile
        context.go('/profile');
        break;
    }
    setCurrentIndex(index);
  }
}
