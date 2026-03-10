import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/app_colors.dart';
import '../../core/utils/scroll_utils.dart';

// Colors now come from ThemeData, not a static class.

/// Phần Hero cho Trang Chủ Portfolio
/// Phần hero portfolio nhà phát triển hiện đại với văn bản gradient và bố cục đáp ứng
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
        Expanded(flex: 2, child: _buildLeftContent(context)),
        const SizedBox(width: AppSpacing.xl),
        Expanded(flex: 1, child: _buildRightContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildRightContent(context),
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
        return Theme.of(context).accentGradient.createShader(bounds);
      },
      child: Text(
        "Xin chào, tôi là Tâm",
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      "Nhà phát triển Flutter",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      "Nhà phát triển Flutter đam mê tạo ra các ứng dụng di động và web đẹp và chức năng với thiết kế hiện đại và mã sạch.",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.textSecondary,
        height: 1.6,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        // Nút Xem Dự Án
        Container(
          decoration: BoxDecoration(
            gradient: Theme.of(context).accentGradient,
            borderRadius: AppBorderRadius.medium,
          ),
          child: ElevatedButton(
            onPressed: () {
              _onButtonPressed('Dự Án');
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
              'Xem Dự Án',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        // Nút Liên Hệ Tôi
        OutlinedButton(
          onPressed: () {
            _onButtonPressed('Liên Hệ');
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primary,
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.medium),
          ),
          child: Text(
            'Liên Hệ Tôi',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: Theme.of(context).accentGradient,
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/tam.jpg',
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(String section) {
    // Cuộn đến các phần tương ứng bằng ScrollNavigationService
    final scrollService = ScrollNavigationService();

    switch (section.toLowerCase()) {
      case 'dự án':
      case 'xem dự án':
        scrollService.scrollToProjects();
        break;
      case 'liên hệ':
      case 'liên hệ tôi':
        scrollService.scrollToContact();
        break;
      default:
        debugPrint('Không biết điều hướng đến: $section');
    }
  }
}
