import 'package:flutter/material.dart';
import '../../core/design_system.dart';

/// Hero Section for Portfolio Home Page
/// Modern developer portfolio hero section with gradient text and responsive layout
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        return Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildLeftContent(context),
        ),
        const SizedBox(width: AppSpacing.xl),
        Expanded(
          flex: 1,
          child: _buildRightContent(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRightContent(),
        const SizedBox(height: AppSpacing.xl),
        _buildLeftContent(context),
      ],
    );
  }

  Widget _buildLeftContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle(context),
        const SizedBox(height: AppSpacing.md),
        _buildSubtitle(context),
        const SizedBox(height: AppSpacing.md),
        _buildDescription(context),
        const SizedBox(height: AppSpacing.lg),
        _buildButtons(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return AppColors.accentGradient.createShader(bounds);
      },
      child: Text(
        "Hi, I'm Tam",
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white, // Shader will override this
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      "Flutter Developer",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      "Passionate Flutter developer creating beautiful and functional mobile and web applications with modern design and clean code.",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[300],
            height: 1.6,
          ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        // View Projects Button
        Container(
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: AppBorderRadius.medium,
          ),
          child: ElevatedButton(
            onPressed: () {
              // TODO: Navigate to projects section
              _onButtonPressed('Projects');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.medium,
              ),
            ),
            child: Text(
              'View Projects',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        // Contact Me Button
        OutlinedButton(
          onPressed: () {
            // TODO: Navigate to contact section
            _onButtonPressed('Contact');
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            side: const BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius.medium,
            ),
          ),
          child: Text(
            'Contact Me',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent() {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.accentGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: const Icon(
          Icons.code,
          size: 150,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onButtonPressed(String section) {
    // Placeholder for navigation logic
    // This could scroll to sections or navigate to pages
    debugPrint('Navigate to: $section');
  }
}