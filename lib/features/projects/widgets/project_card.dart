import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_colors.dart';
import '../data/project_mock_data.dart';

/// Project Card Widget
/// Displays individual project information in a card format
class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

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
          shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.large),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.large,
              border: Border.all(
                color: _isHovered
                    ? Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5)
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image removed by request — visual will be handled elsewhere or later.
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

  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.project.title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      widget.project.description,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.textSecondary,
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
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.2),
                borderRadius: AppBorderRadius.small,
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.5),
                ),
              ),
              child: Text(
                tech,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
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
        // "View" button for detailed project info
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              _onButtonPressed('View');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: AppColors.textPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.small,
              ),
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            ),
            child: const Text(
              'Xem',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        if (widget.project.githubUrl != null) ...[
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                _onButtonPressed('GitHub');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
      ],
    );
  }

  void _showProjectDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.project.title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Công nghệ sử dụng:',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  children: widget.project.technologies
                      .map(
                        (tech) => Chip(
                          label: Text(tech),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.2),
                        ),
                      )
                      .toList(),
                ),
                if (widget.project.images.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Ảnh một vài giao diện:',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.project.images.map((imagePath) {
                      return Tooltip(
                        message: 'Nhấn để phóng to ảnh giao diện',
                        child: GestureDetector(
                          onTap: () => _showImageDialog(context, imagePath),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: AppSpacing.sm,
                            ),
                            child: ClipRRect(
                              borderRadius: AppBorderRadius.small,
                              child: Container(
                                width: 120,
                                height: 200,
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
                if (widget.project.youtubeUrl != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse(widget.project.youtubeUrl!);
                      try {
                        if (!await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        )) {
                          debugPrint('Failed to open YouTube URL: $uri');
                        }
                      } catch (e) {
                        debugPrint('Error launching YouTube URL: $e');
                      }
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Xem Video Demo trên YouTube'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Đóng'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onButtonPressed(String action) async {
    switch (action) {
      case 'View':
        _showProjectDetailsDialog(context);
        break;
      case 'GitHub':
        if (widget.project.githubUrl != null) {
          final uri = Uri.parse(widget.project.githubUrl!);
          try {
            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
              debugPrint('Failed to open GitHub URL: $uri');
            }
          } catch (e) {
            debugPrint('Error launching GitHub URL: $e');
          }
        }
        break;
      default:
        debugPrint('Unknown action: $action');
    }
  }
}
