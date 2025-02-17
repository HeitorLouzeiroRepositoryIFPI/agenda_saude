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
    {
      'icon': Icons.elderly_outlined,
      'title': 'Geriatra',
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
    // TODO: Navigate to specialists list filtered by category
    debugPrint('Selected category: ${category['title']}');
  }

  void onAppointmentTap(int index) {
    final appointment = appointments[index];
    // TODO: Navigate to appointment details
    debugPrint('Selected appointment: ${appointment['doctorName']}');
  }

  void onNotificationsTap() {
    // TODO: Navigate to notifications
    debugPrint('Opening notifications');
  }

  void onSearchTap() {
    // TODO: Navigate to search screen
    debugPrint('Opening search');
  }

  void onViewAllCategories() {
    // TODO: Navigate to all categories
    debugPrint('Opening all categories');
  }

  void onViewAllAppointments() {
    // TODO: Navigate to all appointments
    debugPrint('Opening all appointments');
  }

  // Bottom navigation methods
  void onHomeTab() {
    // Already on home
  }

  void onScheduleTab() {
    // TODO: Navigate to schedule
    debugPrint('Opening schedule');
  }

  void onFavoritesTab() {
    // TODO: Navigate to favorites
    debugPrint('Opening favorites');
  }

  void onProfileTab() {
    // TODO: Navigate to profile
    debugPrint('Opening profile');
  }

  // Handle bottom navigation
  void handleBottomNavigation(BuildContext context, int index) {
    switch (index) {
      case 0: // Home
        onHomeTab();
        break;
      case 1: // Schedule
        context.push('/schedule');
        break;
      case 2: // Favorites
        context.push('/favorites');
        break;
      case 3: // Profile
        context.push('/profile');
        break;
    }
    setCurrentIndex(index);
  }
}
