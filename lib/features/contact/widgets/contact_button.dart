import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import '../../../core/app_colors.dart';
import '../data/contact_mock_data.dart';

/// Contact Button Widget
/// Displays a contact method button with icon, label, and hover effects
class ContactButton extends StatefulWidget {
  final ContactMethod contact;
  final VoidCallback? onPressed;

  const ContactButton({
    super.key,
    required this.contact,
    this.onPressed,
  });

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  colors: [
                    widget.contact.accentColor.withValues(alpha: 0.2),
                    widget.contact.accentColor.withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
          border: Border.all(
            color: _isHovered
                ? widget.contact.accentColor.withValues(alpha: 0.6)
                : widget.contact.accentColor.withValues(alpha: 0.3),
            width: 2,
          ),
          borderRadius: AppBorderRadius.medium,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  AnimatedScale(
                    scale: _isHovered ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      widget.contact.icon,
                      size: 32,
                      color: widget.contact.accentColor,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contact.label,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.contact.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isHovered ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.arrow_outward,
                      size: 20,
                      color: widget.contact.accentColor.withValues(
                        alpha: _isHovered ? 1.0 : 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}