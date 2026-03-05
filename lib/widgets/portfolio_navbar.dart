import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/design_system.dart';
import '../core/utils/scroll_utils.dart';

/// Portfolio Navbar Widget
/// Modern dark portfolio navbar with glass effect background
/// Responsive: horizontal menu on desktop, hamburger on mobile
/// Supports smooth scrolling navigation to portfolio sections
class PortfolioNavbar extends StatelessWidget {
  const PortfolioNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.2),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo/Text
                  _buildLogo(context),

                  // Menu
                  if (isDesktop) _buildDesktopMenu(context) else _buildMobileMenu(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Text(
      'Tam',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      children: [
        _buildMenuItem(context, 'Home'),
        _buildMenuItem(context, 'Projects'),
        _buildMenuItem(context, 'Skills'),
        _buildMenuItem(context, 'Contact'),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: TextButton(
        onPressed: () {
          // TODO: Implement navigation/scroll to section
          _onMenuItemTap(title);
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.medium,
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primaryColor.withValues(alpha: 0.1);
              }
              return null;
            },
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 28,
      ),
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.medium,
      ),
      onSelected: (value) {
        // TODO: Implement navigation/scroll to section
        _onMenuItemTap(value);
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem('Home'),
        _buildPopupMenuItem('Projects'),
        _buildPopupMenuItem('Skills'),
        _buildPopupMenuItem('Contact'),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String title) {
    return PopupMenuItem<String>(
      value: title,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _onMenuItemTap(String title) {
    final scrollService = ScrollNavigationService();
    
    switch (title.toLowerCase()) {
      case 'home':
        scrollService.scrollToHome();
        break;
      case 'projects':
        scrollService.scrollToProjects();
        break;
      case 'skills':
        scrollService.scrollToSkills();
        break;
      case 'contact':
        scrollService.scrollToContact();
        break;
      default:
        debugPrint('Navigate to: $title');
    }
  }
}