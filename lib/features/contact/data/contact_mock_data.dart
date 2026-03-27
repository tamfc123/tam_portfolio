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
    value: 'chitam.dev@gmail.com',
    icon: Icons.email_outlined,
    accentColor: const Color(0xFF7C3AED),
    url: 'mailto:chitam.dev@gmail.com',
  ),
  ContactMethod(
    label: 'GitHub',
    value: 'tamfc123',
    icon: Icons.code,
    accentColor: const Color(0xFFFFFFFF),
    url: 'https://github.com/tamfc123',
  ),
  ContactMethod(
    label: 'LinkedIn',
    value: 'ctam-le',
    icon: Icons.business,
    accentColor: const Color(0xFF0A66C2),
    url: 'https://www.linkedin.com/in/ctam-le-2a6b0534a/?trk=opento_sprofile_details',
  ),
];