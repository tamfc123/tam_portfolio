import 'package:flutter/material.dart';

/// Skill Model for Tech Stack
class SkillModel {
  final String name;
  final IconData icon;
  final Color accentColor;

  SkillModel({
    required this.name,
    required this.icon,
    required this.accentColor,
  });
}

/// Mock data for tech stack skills
final List<SkillModel> skillsMockData = [
  SkillModel(
    name: 'Flutter',
    icon: Icons.flutter_dash,
    accentColor: const Color(0xFF02569B),
  ),
  SkillModel(
    name: 'Dart',
    icon: Icons.code,
    accentColor: const Color(0xFF00D4FF),
  ),
  SkillModel(
    name: 'NodeJS',
    icon: Icons.settings,
    accentColor: const Color(0xFF68A063),
  ),
  SkillModel(
    name: 'MongoDB',
    icon: Icons.storage,
    accentColor: const Color(0xFF13AA52),
  ),
  SkillModel(
    name: 'PostgreSQL',
    icon: Icons.dataset,
    accentColor: const Color(0xFF336791),
  ),
  SkillModel(
    name: 'Git',
    icon: Icons.merge_type,
    accentColor: const Color(0xFFF1502F),
  ),
  SkillModel(
    name: 'REST API',
    icon: Icons.api,
    accentColor: const Color(0xFF7C3AED),
  ),
];