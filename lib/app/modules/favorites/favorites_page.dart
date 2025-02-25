import 'package:flutter/material.dart';
import 'widgets/professional_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary data for demonstration
    final professionals = [
      {
        'name': 'Dr. João Silva',
        'specialty': 'Cardiologista',
        'rating': 4.8,
        'location': 'São Paulo, SP',
        'isFavorite': true,
      },
      {
        'name': 'Dra. Maria Santos',
        'specialty': 'Dermatologista',
        'rating': 4.9,
        'location': 'Rio de Janeiro, RJ',
        'isFavorite': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: professionals.length,
      itemBuilder: (context, index) {
        final professional = professionals[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ProfessionalCard(
            name: professional['name'] as String,
            specialty: professional['specialty'] as String,
            rating: professional['rating'] as double,
            location: professional['location'] as String,
            isFavorite: professional['isFavorite'] as bool,
            onFavoritePressed: () {
              // TODO: Implement favorite toggle functionality
            },
            onTap: () {
              // TODO: Navigate to professional profile
            },
          ),
        );
      },
    );
  }
}
