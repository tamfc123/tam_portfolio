import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/app_colors.dart';
import '../../core/utils/scroll_utils.dart';

/// Hero Section với staggered animations:
/// - Fade + SlideUp cho title, subtitle, description, buttons (stagger 150ms)
/// - Pulsing glow cho avatar
/// - Hover glow cho gradient button
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  // ── Staggered entry controllers ──────────────────────────────────────────
  late final AnimationController _entryController;
  late final Animation<double> _titleFade;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _subtitleFade;
  late final Animation<Offset> _subtitleSlide;
  late final Animation<double> _descFade;
  late final Animation<Offset> _descSlide;
  late final Animation<double> _buttonsFade;
  late final Animation<Offset> _buttonsSlide;

  // ── Avatar pulse glow ────────────────────────────────────────────────────
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnim;

  // ── Button hover ─────────────────────────────────────────────────────────
  bool _primaryHovered = false;
  bool _outlinedHovered = false;

  @override
  void initState() {
    super.initState();

    // Entry animation — 1.2s total with stagger intervals
    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Helper to build a fade+slide pair within a time interval
    Animation<double> makeFade(double begin, double end) => CurvedAnimation(
          parent: _entryController,
          curve: Interval(begin, end, curve: Curves.easeOut),
        );

    Animation<Offset> makeSlide(double begin, double end) => Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _entryController,
            curve: Interval(begin, end, curve: Curves.easeOut),
          ),
        );

    _titleFade = makeFade(0.0, 0.4);
    _titleSlide = makeSlide(0.0, 0.4);

    _subtitleFade = makeFade(0.15, 0.55);
    _subtitleSlide = makeSlide(0.15, 0.55);

    _descFade = makeFade(0.30, 0.70);
    _descSlide = makeSlide(0.30, 0.70);

    _buttonsFade = makeFade(0.50, 0.90);
    _buttonsSlide = makeSlide(0.50, 0.90);

    // Avatar pulse glow — repeating
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnim = Tween<double>(begin: 10, end: 30).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Start entry after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _entryController.forward();
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  // ── Build ────────────────────────────────────────────────────────────────

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

  // ── Left content (staggered) ─────────────────────────────────────────────

  Widget _buildLeftContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _animated(_titleFade, _titleSlide, _buildTitle(context)),
        const SizedBox(height: AppSpacing.md),
        _animated(_subtitleFade, _subtitleSlide, _buildSubtitle(context)),
        const SizedBox(height: AppSpacing.md),
        _animated(_descFade, _descSlide, _buildDescription(context)),
        const SizedBox(height: AppSpacing.lg),
        _animated(_buttonsFade, _buttonsSlide, _buildButtons(context)),
      ],
    );
  }

  Widget _animated(
    Animation<double> fade,
    Animation<Offset> slide,
    Widget child,
  ) {
    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) =>
          Theme.of(context).accentGradient.createShader(bounds),
      child: Text(
        'Xin chào, tôi là Tâm',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      'Nhà phát triển Flutter',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      'Nhà phát triển Flutter đam mê tạo ra các ứng dụng di động và web đẹp và chức năng với thiết kế hiện đại và mã sạch.',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
    );
  }

  // ── Buttons with hover effect ────────────────────────────────────────────

  Widget _buildButtons(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      children: [
        // Primary gradient button with hover glow
        MouseRegion(
          onEnter: (_) => setState(() => _primaryHovered = true),
          onExit: (_) => setState(() => _primaryHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              gradient: Theme.of(context).accentGradient,
              borderRadius: AppBorderRadius.medium,
              boxShadow: _primaryHovered
                  ? [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: ElevatedButton(
              onPressed: () => _onButtonPressed('Dự Án'),
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
        ),
        // Outlined button with hover fill
        MouseRegion(
          onEnter: (_) => setState(() => _outlinedHovered = true),
          onExit: (_) => setState(() => _outlinedHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: _outlinedHovered
                  ? Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: AppBorderRadius.medium,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: OutlinedButton(
              onPressed: () => _onButtonPressed('Liên Hệ'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                side: BorderSide.none, // handled by AnimatedContainer
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.medium,
                ),
              ),
              child: Text(
                'Liên Hệ Tôi',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Right content (avatar with pulse glow) ───────────────────────────────

  Widget _buildRightContent(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _pulseAnim,
        builder: (context, child) {
          return Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: Theme.of(context).accentGradient,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.4),
                  blurRadius: _pulseAnim.value,
                  spreadRadius: _pulseAnim.value / 4,
                ),
              ],
            ),
            child: child,
          );
        },
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

  // ── Navigation ───────────────────────────────────────────────────────────

  void _onButtonPressed(String section) {
    final scrollService = ScrollNavigationService();
    switch (section.toLowerCase()) {
      case 'dự án':
        scrollService.scrollToProjects();
        break;
      case 'liên hệ':
        scrollService.scrollToContact();
        break;
      default:
        debugPrint('Không biết điều hướng đến: $section');
    }
  }
}
