import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/design_system.dart';
import '../core/utils/scroll_utils.dart';

/// Portfolio Navbar Widget
/// Modern dark portfolio navbar with glass effect background
/// Responsive: horizontal menu on desktop, hamburger on mobile
/// Supports smooth scrolling navigation to portfolio sections with active indicator
class PortfolioNavbar extends StatefulWidget {
  const PortfolioNavbar({super.key});

  @override
  State<PortfolioNavbar> createState() => _PortfolioNavbarState();
}

class _PortfolioNavbarState extends State<PortfolioNavbar> {
  String _activeMenuItem = 'home';

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
                color: AppColors.backgroundPrimary.withValues(alpha: 0.2),
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.textPrimary.withValues(alpha: 0.1),
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
                  if (isDesktop)
                    _buildDesktopMenu(context)
                  else
                    _buildMobileMenu(context),
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
      'Lê Trần Chí Tâm',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      children: [
        _buildMenuItemWithIndicator(context, 'Trang chủ', 'home'),
        _buildMenuItemWithIndicator(context, 'Dự án', 'projects'),
        _buildMenuItemWithIndicator(context, 'Kỹ năng', 'skills'),
        _buildMenuItemWithIndicator(context, 'Liên hệ', 'contact'),
      ],
    );
  }

  Widget _buildMenuItemWithIndicator(
    BuildContext context,
    String title,
    String navigationKey,
  ) {
    final isActive = _activeMenuItem == navigationKey;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _activeMenuItem = navigationKey;
              });
              _onMenuItemTap(navigationKey);
            },
            style: TextButton.styleFrom(
              foregroundColor: isActive
                  ? Theme.of(context).colorScheme.primary
                  : AppColors.textPrimary,
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : AppColors.textPrimary,
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
                    return Theme.of(context).colorScheme.primary.withValues(
                          alpha: 0.15,
                        );
                  }
                  return null;
                },
              ),
            ),
            child: Text(title),
          ),
          // Animated indicator line - underline appears only when active
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 3,
            width: isActive ? 30 : 0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: AppColors.textPrimary,
        size: 28,
      ),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.medium,
      ),
      onSelected: (value) {
        setState(() {
          _activeMenuItem = value;
        });
        _onMenuItemTap(value);
      },
      itemBuilder: (context) => [
        _buildPopupMenuItem('Trang chủ', 'home'),
        _buildPopupMenuItem('Dự án', 'projects'),
        _buildPopupMenuItem('Kỹ năng', 'skills'),
        _buildPopupMenuItem('Liên hệ', 'contact'),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String title, String value) {
    return PopupMenuItem<String>(
      value: value,
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
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