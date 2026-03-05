import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import '../data/project_mock_data.dart';

/// Project Card Widget
/// Displays individual project information in a card format
class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Card(
          elevation: _isHovered ? 12 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.large,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.large,
              border: Border.all(
                color: _isHovered
                    ? AppColors.primaryColor.withValues(alpha: 0.5)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Image
                _buildProjectImage(),
                // Content
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(context),
                      const SizedBox(height: AppSpacing.sm),
                      _buildDescription(context),
                      const SizedBox(height: AppSpacing.md),
                      _buildTechnologies(),
                      const SizedBox(height: AppSpacing.md),
                      _buildButtons(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectImage() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        gradient: AppColors.accentGradient,
      ),
      child: Center(
        child: Icon(
          Icons.image,
          size: 60,
          color: Colors.white.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.project.title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      widget.project.description,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[300],
            height: 1.5,
          ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTechnologies() {
    return Wrap(
      spacing: AppSpacing.sm,
      children: widget.project.technologies
          .map(
            (tech) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.2),
                borderRadius: AppBorderRadius.small,
                border: Border.all(
                  color: AppColors.primaryColor.withValues(alpha: 0.5),
                ),
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        if (widget.project.projectUrl != null)
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _onButtonPressed('Project');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.small,
                ),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              ),
              child: const Text(
                'View',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        if (widget.project.projectUrl != null && widget.project.githubUrl != null)
          const SizedBox(width: AppSpacing.sm),
        if (widget.project.githubUrl != null)
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                _onButtonPressed('GitHub');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.secondaryColor,
                side: const BorderSide(color: AppColors.secondaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.small,
                ),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              ),
              child: const Text(
                'GitHub',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
      ],
    );
  }

  void _onButtonPressed(String action) {
    debugPrint('Project: ${widget.project.title}, Action: $action');
    // TODO: Implement URL launch logic
  }
}