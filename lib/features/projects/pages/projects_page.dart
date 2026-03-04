import 'package:flutter/material.dart';

/// Projects Page
/// Displays all projects in the portfolio
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'My Projects',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Grid of projects
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Project ${index + 1}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
