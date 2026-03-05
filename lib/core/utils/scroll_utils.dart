import 'package:flutter/material.dart';

/// Scroll Navigation Utility
/// Handles smooth scrolling to different sections in the portfolio
class ScrollNavigationService {
  static final ScrollNavigationService _instance = ScrollNavigationService._internal();

  factory ScrollNavigationService() {
    return _instance;
  }

  ScrollNavigationService._internal();

  // Global Keys for sections
  late GlobalKey<State> heroSectionKey;
  late GlobalKey<State> projectSectionKey;
  late GlobalKey<State> skillsSectionKey;
  late GlobalKey<State> contactSectionKey;

  late ScrollController scrollController;

  /// Initialize keys and scroll controller
  void initialize({
    required GlobalKey heroKey,
    required GlobalKey projectKey,
    required GlobalKey skillsKey,
    required GlobalKey contactKey,
    required ScrollController controller,
  }) {
    heroSectionKey = heroKey;
    projectSectionKey = projectKey;
    skillsSectionKey = skillsKey;
    contactSectionKey = contactKey;
    scrollController = controller;
  }

  /// Scroll to specific section with smooth animation
  Future<void> scrollToSection(GlobalKey key) async {
    await Scrollable.ensureVisible(
      key.currentContext ?? _instance.heroSectionKey.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
      alignment: 0.0, // Align to top
    ).catchError((_) {
      debugPrint('Error scrolling to section');
    });
  }

  /// Scroll to Home section
  Future<void> scrollToHome() => scrollToSection(heroSectionKey);

  /// Scroll to Projects section
  Future<void> scrollToProjects() => scrollToSection(projectSectionKey);

  /// Scroll to Skills section
  Future<void> scrollToSkills() => scrollToSection(skillsSectionKey);

  /// Scroll to Contact section
  Future<void> scrollToContact() => scrollToSection(contactSectionKey);

  /// Dispose resources
  void dispose() {
    scrollController.dispose();
  }
}