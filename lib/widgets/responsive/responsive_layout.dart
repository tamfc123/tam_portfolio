import 'package:flutter/material.dart';

/// Responsive Layout Widget
/// Provides different layouts based on screen size using LayoutBuilder
/// 
/// Breakpoints:
/// - Mobile:  < 600
/// - Tablet:  600 - 1020
/// - Desktop: > 1020
class ResponsiveLayout extends StatelessWidget {
  /// Widget to display on mobile devices (< 600 width)
  final WidgetBuilder mobile;

  /// Widget to display on tablet devices (600 - 1020 width)
  /// Falls back to mobile if not provided
  final WidgetBuilder? tablet;

  /// Widget to display on desktop devices (> 1020 width)
  /// Falls back to tablet or mobile if not provided
  final WidgetBuilder? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Desktop: width > 1020
        if (width > 1020) {
          return desktop?.call(context) ??
              tablet?.call(context) ??
              mobile(context);
        }
        // Tablet: 600 <= width <= 1020
        else if (width >= 600) {
          return tablet?.call(context) ?? mobile(context);
        }
        // Mobile: width < 600
        else {
          return mobile(context);
        }
      },
    );
  }
}

/// Responsive Padding Widget
/// Applies different padding based on screen size
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  
  /// Padding for mobile devices
  final EdgeInsets mobilePadding;
  
  /// Padding for tablet devices
  final EdgeInsets? tabletPadding;
  
  /// Padding for desktop devices
  final EdgeInsets? desktopPadding;

  const ResponsivePadding({
    super.key,
    required this.child,
    required this.mobilePadding,
    this.tabletPadding,
    this.desktopPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: (context) => Padding(
        padding: mobilePadding,
        child: child,
      ),
      tablet: (context) => Padding(
        padding: tabletPadding ?? mobilePadding,
        child: child,
      ),
      desktop: (context) => Padding(
        padding: desktopPadding ?? tabletPadding ?? mobilePadding,
        child: child,
      ),
    );
  }
}

/// Responsive Container Widget
/// Creates a container with responsive constraints
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  
  /// Max width for mobile
  final double? mobileMaxWidth;
  
  /// Max width for tablet
  final double? tabletMaxWidth;
  
  /// Max width for desktop
  final double? desktopMaxWidth;
  
  /// Background color
  final Color? backgroundColor;
  
  /// Padding
  final EdgeInsets? padding;
  
  /// Border radius
  final BorderRadius? borderRadius;
  
  /// BoxDecoration
  final BoxDecoration? decoration;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.mobileMaxWidth,
    this.tabletMaxWidth,
    this.desktopMaxWidth,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: (context) => Container(
        constraints: mobileMaxWidth != null
            ? BoxConstraints(maxWidth: mobileMaxWidth!)
            : null,
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
        padding: padding,
        child: child,
      ),
      tablet: (context) => Container(
        constraints: tabletMaxWidth != null
            ? BoxConstraints(maxWidth: tabletMaxWidth!)
            : null,
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
        padding: padding,
        child: child,
      ),
      desktop: (context) => Container(
        constraints: desktopMaxWidth != null
            ? BoxConstraints(maxWidth: desktopMaxWidth!)
            : null,
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
        padding: padding,
        child: child,
      ),
    );
  }
}

/// Responsive Grid Widget
/// Creates a grid with responsive column count
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  
  /// Number of columns for mobile
  final int mobileColumns;
  
  /// Number of columns for tablet
  final int? tabletColumns;
  
  /// Number of columns for desktop
  final int? desktopColumns;
  
  /// Spacing between items
  final double spacing;
  
  /// Running spacing between items
  final double runSpacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns,
    this.desktopColumns,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: (context) => Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: children
            .asMap()
            .entries
            .map((entry) {
              final child = entry.value;
              
              final itemWidth = (MediaQuery.of(context).size.width -
                      spacing * (mobileColumns - 1)) /
                  mobileColumns;
              
              return SizedBox(
                width: itemWidth,
                child: child,
              );
            })
            .toList(),
      ),
      tablet: (context) {
        final columns = tabletColumns ?? mobileColumns;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: children
              .asMap()
              .entries
              .map((entry) {
                final child = entry.value;
                
                final itemWidth =
                    (MediaQuery.of(context).size.width - spacing * (columns - 1)) /
                        columns;
                
                return SizedBox(
                  width: itemWidth,
                  child: child,
                );
              })
              .toList(),
        );
      },
      desktop: (context) {
        final columns = desktopColumns ?? tabletColumns ?? mobileColumns;
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          children: children
              .asMap()
              .entries
              .map((entry) {
                final child = entry.value;
                
                final itemWidth =
                    (MediaQuery.of(context).size.width - spacing * (columns - 1)) /
                        columns;
                
                return SizedBox(
                  width: itemWidth,
                  child: child,
                );
              })
              .toList(),
        );
      },
    );
  }
}

/// Responsive Text Widget
/// Adjusts font size based on screen size
class ResponsiveText extends StatelessWidget {
  final String text;
  
  /// Font size for mobile
  final double mobileFontSize;
  
  /// Font size for tablet
  final double? tabletFontSize;
  
  /// Font size for desktop
  final double? desktopFontSize;
  
  /// Text style
  final TextStyle? style;
  
  /// Text align
  final TextAlign? textAlign;
  
  /// Max lines
  final int? maxLines;
  
  /// Overflow
  final TextOverflow? overflow;

  const ResponsiveText(
    this.text, {
    super.key,
    required this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: (context) => Text(
        text,
        style: (style ?? const TextStyle()).copyWith(
          fontSize: mobileFontSize,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
      tablet: (context) => Text(
        text,
        style: (style ?? const TextStyle()).copyWith(
          fontSize: tabletFontSize ?? mobileFontSize,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
      desktop: (context) => Text(
        text,
        style: (style ?? const TextStyle()).copyWith(
          fontSize: desktopFontSize ?? tabletFontSize ?? mobileFontSize,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}

/// Screen Size Extension
/// Provides helper methods to check screen size
extension ScreenSizeExtension on BuildContext {
  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Check if device is mobile (< 600)
  bool get isMobile => screenWidth < 600;

  /// Check if device is tablet (600 - 1020)
  bool get isTablet => screenWidth >= 600 && screenWidth <= 1020;

  /// Check if device is desktop (> 1020)
  bool get isDesktop => screenWidth > 1020;

  /// Get device orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  /// Check if in portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// Check if in landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// Get device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Get padding (safe area)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Get viewInsets (keyboard, status bar)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}

/// Responsive Breakpoints Constants
class ResponsiveBreakpoints {
  // Private constructor to prevent instantiation
  ResponsiveBreakpoints._();

  /// Mobile breakpoint
  static const double mobile = 600.0;

  /// Tablet breakpoint
  static const double tablet = 1020.0;

  /// Mobile max width
  static const double mobileMax = 599.9;

  /// Tablet min width
  static const double tabletMin = 600.0;

  /// Tablet max width
  static const double tabletMax = 1020.0;

  /// Desktop min width
  static const double desktopMin = 1020.1;

  /// Get breakpoint name from width
  static String getBreakpointName(double width) {
    if (width < mobile) {
      return 'Mobile';
    } else if (width >= tablet) {
      return 'Desktop';
    } else {
      return 'Tablet';
    }
  }
}
