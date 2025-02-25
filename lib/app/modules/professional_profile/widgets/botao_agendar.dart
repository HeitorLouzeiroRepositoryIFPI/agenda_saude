import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BotaoAgendar extends StatelessWidget {
  const BotaoAgendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to appointment screen with the current doctor's ID
          context.go('/schedule-appointment/1'); // Using a dummy ID for now
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Agendar Consulta',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
