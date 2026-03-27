import 'package:flutter/material.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final Duration delay;
  final Duration duration;
  final Offset slideBegin;

  const AnimatedSection({
    super.key,
    required this.child,
    required this.scrollController,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.slideBegin = const Offset(0, 0.12),
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  final GlobalKey _key = GlobalKey();
  bool _triggered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: widget.slideBegin,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    widget.scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() => _checkVisibility();

  void _checkVisibility() {
    if (_triggered) return;

    final renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    final widgetTop = position.dy;
    final widgetBottom = widgetTop + renderBox.size.height;

    if (widgetTop < screenHeight * 0.92 && widgetBottom > 0) {
      _triggered = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      key: _key,
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
