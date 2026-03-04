import 'package:flutter/material.dart';

/// About Page
/// Information about the portfolio owner
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome! I\'m a passionate Flutter developer with experience building beautiful and functional web applications.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSkillList(),
            const SizedBox(height: 24),
            const Text(
              'Experience',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildExperienceItem(
              title: 'Flutter Developer',
              company: 'Your Company',
              duration: '2023 - Present',
              description: 'Developing web and mobile applications',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillList() {
    final skills = [
      'Flutter',
      'Dart',
      'Web Development',
      'UI/UX Design',
      'Firebase',
      'REST APIs',
    ];

    return Wrap(
      spacing: 8,
      children: skills
          .map((skill) => Chip(
                label: Text(skill),
              ))
          .toList(),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String duration,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$company • $duration',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
