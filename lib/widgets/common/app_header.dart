import 'package:flutter/material.dart';

/// App Header
/// Reusable header component for the application
class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onLogoTap;
  final List<Widget>? actions;

  const AppHeader({
    super.key,
    required this.title,
    this.onLogoTap,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: onLogoTap,
        child: Text(title),
      ),
      actions: actions,
      elevation: 0,
    );
  }
}
