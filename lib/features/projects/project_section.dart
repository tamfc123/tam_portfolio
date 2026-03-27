import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import 'data/project_mock_data.dart';
import 'widgets/project_card.dart';

/// Projects Section Widget
/// Displays portfolio projects in a responsive grid layout
class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context),
          const SizedBox(height: AppSpacing.xl),
          _buildProjectsGrid(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dự án của tôi',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: constraints.maxWidth > 600 ? 200 : 80,
              height: 4,
              decoration: BoxDecoration(
                gradient: Theme.of(context).accentGradient,
                borderRadius: AppBorderRadius.small,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 800;

        // Calculate card width based on available space
        late int crossAxisCount;
        if (isDesktop) {
          crossAxisCount = 3; // 3 columns on desktop
        } else if (isTablet) {
          crossAxisCount = 2; // 2 columns on tablet
        } else {
          crossAxisCount = 1; // 1 column on mobile
        }

        // Calculate the width of each card
        final cardWidth =
            (constraints.maxWidth - (AppSpacing.lg * (crossAxisCount - 1))) /
            crossAxisCount;

        return Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: projectsMockData
              .asMap()
              .entries
              .map(
                (entry) => SizedBox(
                  width: cardWidth,
                  child: ProjectCard(
                    project: entry.value,
                    animationDelay:
                        Duration(milliseconds: entry.key * 80),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
