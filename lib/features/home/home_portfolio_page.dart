import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/app_colors.dart';
import '../../core/utils/scroll_utils.dart';
import '../../widgets/animated_section.dart';
import '../../widgets/portfolio_navbar.dart';
import '../home/hero_section.dart';
import '../projects/project_section.dart';
import '../skills/skills_section.dart';
import '../contact/contact_section.dart';

class HomePortfolioPage extends StatefulWidget {
  const HomePortfolioPage({super.key});

  @override
  State<HomePortfolioPage> createState() => _HomePortfolioPageState();
}

class _HomePortfolioPageState extends State<HomePortfolioPage> {
  final GlobalKey _heroSectionKey = GlobalKey();
  final GlobalKey _projectSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScrollNavigationService().initialize(
        heroKey: _heroSectionKey,
        projectKey: _projectSectionKey,
        skillsKey: _skillsSectionKey,
        contactKey: _contactSectionKey,
        controller: _scrollController,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: const PortfolioNavbar(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              key: _heroSectionKey,
              child: const HeroSection(),
            ),
            const Divider(height: 1),
            AnimatedSection(
              scrollController: _scrollController,
              delay: const Duration(milliseconds: 100),
              child: Container(
                key: _projectSectionKey,
                child: const ProjectSection(),
              ),
            ),
            const Divider(height: 1),
            AnimatedSection(
              scrollController: _scrollController,
              delay: const Duration(milliseconds: 100),
              child: Container(
                key: _skillsSectionKey,
                child: const SkillsSection(),
              ),
            ),
            const Divider(height: 1),
            AnimatedSection(
              scrollController: _scrollController,
              delay: const Duration(milliseconds: 100),
              child: Container(
                key: _contactSectionKey,
                child: const ContactSection(),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.textPrimary.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Center(
        child: Text(
          '© 2026 Tam Portfolio. All rights reserved.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ),
    );
  }
}