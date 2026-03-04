import 'package:flutter/material.dart';

/// Home Page
/// The main homepage of the portfolio
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              color: Colors.blue,
              height: 400,
              child: const Center(
                child: Text(
                  'Welcome to My Portfolio',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Add more sections here
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
