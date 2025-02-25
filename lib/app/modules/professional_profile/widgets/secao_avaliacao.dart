import 'package:flutter/material.dart';

class SecaoAvaliacao extends StatelessWidget {
  const SecaoAvaliacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Row(
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '5.0',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '(128 avaliações)',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
