import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import '../../../core/app_colors.dart';
import '../data/skills_mock_data.dart';

/// Skill Card Widget
/// Displays individual technology/skill in a glassmorphism card with hover animation
class SkillCard extends StatefulWidget {
  final SkillModel skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.medium,
            border: Border.all(
              color: _isHovered
                  ? widget.skill.accentColor.withValues(alpha: 0.5)
                  : AppColors.textPrimary.withValues(alpha: 0.1),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.skill.accentColor.withValues(alpha: 0.3)
                    : AppColors.backgroundPrimary.withValues(alpha: 0.2),
                blurRadius: _isHovered ? 16 : 8,
                spreadRadius: _isHovered ? 2 : 0,
              ),
            ],
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textPrimary.withValues(alpha: 0.05),
                  borderRadius: AppBorderRadius.medium,
                ),
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon
                    AnimatedScale(
                      scale: _isHovered ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        widget.skill.icon,
                        size: 48,
                        color: _isHovered
                            ? widget.skill.accentColor
                            : AppColors.textPrimary.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    // Skill Name
                    Text(
                      widget.skill.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: _isHovered
                                ? widget.skill.accentColor
                                : AppColors.textPrimary.withValues(alpha: 0.8),
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}