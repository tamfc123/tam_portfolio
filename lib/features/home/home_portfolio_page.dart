import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/utils/scroll_utils.dart';
import '../../widgets/portfolio_navbar.dart';
import '../home/hero_section.dart';
import '../projects/project_section.dart';
import '../skills/skills_section.dart';
import '../contact/contact_section.dart';

/// Main Portfolio Home Page
/// Single-page portfolio with smooth scrolling navigation to all sections
/// Sections: Hero, Projects, Skills, Contact
class HomePortfolioPage extends StatefulWidget {
  const HomePortfolioPage({super.key});

  @override
  State<HomePortfolioPage> createState() => _HomePortfolioPageState();
}

class _HomePortfolioPageState extends State<HomePortfolioPage> {
  // Section Keys for smooth scrolling
  final GlobalKey _heroSectionKey = GlobalKey();
  final GlobalKey _projectSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  // Scroll Controller
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    // Initialize scroll navigation service
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
      backgroundColor: AppColors.backgroundColor,
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
            // Hero Section
            Container(
              key: _heroSectionKey,
              child: const HeroSection(),
            ),
            // Divider
            const Divider(height: 1),
            // Projects Section
            Container(
              key: _projectSectionKey,
              child: const ProjectSection(),
            ),
            // Divider
            const Divider(height: 1),
            // Skills Section
            Container(
              key: _skillsSectionKey,
              child: const SkillsSection(),
            ),
            // Divider
            const Divider(height: 1),
            // Contact Section
            Container(
              key: _contactSectionKey,
              child: const ContactSection(),
            ),
            // Footer
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
        color: AppColors.surfaceColor,
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Center(
        child: Text(
          '© 2026 Tam Portfolio. All rights reserved.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[500],
              ),
        ),
      ),
    );
  }
}