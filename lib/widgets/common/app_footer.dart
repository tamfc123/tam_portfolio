import 'package:flutter/material.dart';

/// App Footer
/// Reusable footer component for the application
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: Colors.grey[900],
      child: Column(
        children: [
          const Text(
            'Tam Portfolio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.link, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.code, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.mail, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© 2024 Tam Portfolio. All rights reserved.',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
