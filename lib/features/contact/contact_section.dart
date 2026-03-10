import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/app_colors.dart';
import 'data/contact_mock_data.dart';
import 'widgets/contact_button.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget Phần Liên Hệ
/// Hiển thị thông tin liên hệ với các phương pháp (Email, GitHub, LinkedIn)
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.xl,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context),
          const SizedBox(height: AppSpacing.xl),
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Liên Hệ Với Tôi',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: Theme.of(context).accentGradient,
            borderRadius: AppBorderRadius.small,
          ),
        ),
      ],
    );
  }

  Widget _buildContactContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        if (isDesktop) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: _buildLeftContent(context),
              ),
              const SizedBox(width: AppSpacing.xl),
              Expanded(
                flex: 1,
                child: _buildRightContent(context),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeftContent(context),
              const SizedBox(height: AppSpacing.xl),
              _buildRightContent(context),
            ],
          );
        }
      },
    );
  }

  Widget _buildLeftContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hãy Kết Nối',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Tôi luôn quan tâm đến các dự án và cơ hội mới. Hãy thoải mái liên hệ thông qua bất kỳ phương pháp nào dưới đây.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Thời gian phản hồi: Trong vòng 24 giờ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: contactMethodsMockData
          .map<Widget>(
            (contact) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: ContactButton(
                contact: contact,
                onPressed: () {
                  _onContactMethodPressed(contact);
                },
              ),
            ),
          )
          .toList(),
    );
  }

  void _onContactMethodPressed(ContactMethod contact) async {
    debugPrint('Phương pháp liên hệ: ${contact.label}');
    if (contact.url != null) {
      final uri = Uri.parse(contact.url!);
      try {
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          debugPrint('Không thể mở URL: $uri');
        }
      } catch (e) {
        debugPrint('Lỗi khi mở URL: $e');
      }
    }
  }
}