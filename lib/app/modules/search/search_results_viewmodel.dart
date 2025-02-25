import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultsViewModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  // Mock data for search results
  final List<Map<String, dynamic>> results = [
    {
      'name': 'Dra. Maria Silva',
      'specialty': 'Clínico Geral',
      'rating': 4.8,
      'reviewCount': 127,
      'location': 'Centro, 2km',
      'onlineConsultation': true,
      'availableToday': true,
      'id': '1',
    },
    {
      'name': 'Dr. Carlos Santos',
      'specialty': 'Clínico Geral',
      'rating': 4.7,
      'reviewCount': 98,
      'location': 'Zona Sul, 3.5km',
      'onlineConsultation': true,
      'availableToday': false,
      'id': '2',
    },
    {
      'name': 'Dr. João Oliveira',
      'specialty': 'Clínico Geral',
      'rating': 4.9,
      'reviewCount': 156,
      'location': 'Centro, 1.5km',
      'onlineConsultation': true,
      'availableToday': true,
      'id': '3',
    },
  ];

  // Filter states
  bool isSpecialtyFilterActive = true;
  bool isRatingFilterActive = false;
  bool isAvailabilityFilterActive = false;
  bool isOnlineFilterActive = false;

  void onSearchChanged(String value) {
    // TODO: Implement search filtering
    notifyListeners();
  }

  void onFilterTap(BuildContext context) {
    // TODO: Show filter modal
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Filtros',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            // TODO: Add filter options
          ],
        ),
      ),
    );
  }

  void onDoctorTap(BuildContext context, Map<String, dynamic> doctor) {
    context.push('/doctor/${doctor['id']}');
  }

  void toggleSpecialtyFilter() {
    isSpecialtyFilterActive = !isSpecialtyFilterActive;
    notifyListeners();
  }

  void toggleRatingFilter() {
    isRatingFilterActive = !isRatingFilterActive;
    notifyListeners();
  }

  void toggleAvailabilityFilter() {
    isAvailabilityFilterActive = !isAvailabilityFilterActive;
    notifyListeners();
  }

  void toggleOnlineFilter() {
    isOnlineFilterActive = !isOnlineFilterActive;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
