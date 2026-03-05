import 'package:flutter/material.dart';

/// Contact Method Model
class ContactMethod {
  final String label;
  final String value;
  final IconData icon;
  final Color accentColor;
  final String? url;

  ContactMethod({
    required this.label,
    required this.value,
    required this.icon,
    required this.accentColor,
    this.url,
  });
}

/// Mock data for contact methods
final List<ContactMethod> contactMethodsMockData = [
  ContactMethod(
    label: 'Email',
    value: 'contact@tam.dev',
    icon: Icons.email_outlined,
    accentColor: const Color(0xFF7C3AED),
    url: 'mailto:contact@tam.dev',
  ),
  ContactMethod(
    label: 'GitHub',
    value: '@tam-dev',
    icon: Icons.code,
    accentColor: const Color(0xFFFFFFFF),
    url: 'https://github.com/tam-dev',
  ),
  ContactMethod(
    label: 'LinkedIn',
    value: 'tam-dev',
    icon: Icons.business,
    accentColor: const Color(0xFF0A66C2),
    url: 'https://linkedin.com/in/tam-dev',
  ),
];