import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import 'data/skills_mock_data.dart';
import 'widgets/skill_card.dart';

/// Skills Section Widget
/// Displays tech stack skills in a responsive grid layout
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context),
          const SizedBox(height: AppSpacing.xl),
          _buildSkillsGrid(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tech Stack',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: AppBorderRadius.small,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 800;

        // Calculate card width and number of columns
        late int crossAxisCount;
        if (isDesktop) {
          crossAxisCount = 4; // 4 columns on desktop
        } else if (isTablet) {
          crossAxisCount = 3; // 3 columns on tablet
        } else {
          crossAxisCount = 2; // 2 columns on mobile
        }

        // Calculate the width of each card
        final cardWidth =
            (constraints.maxWidth - (AppSpacing.lg * (crossAxisCount - 1))) /
                crossAxisCount;

        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: skillsMockData
              .map(
                (skill) => SizedBox(
                  width: cardWidth,
                  height: 180,
                  child: SkillCard(skill: skill),
                ),
              )
              .toList(),
        );
      },
    );
  }
}