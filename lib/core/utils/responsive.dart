import 'package:flutter/material.dart';

// responsive.dart - WEB-SPECIFIC BREAKPOINTS (CSS standard)
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  // Standard CSS breakpoints (matches Bootstrap, Tailwind)
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768; // Phones

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024; // Tablets, small laptops

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  // Optional: Add landscape detection for tablets
  static bool isTabletLandscape(BuildContext context) =>
      isTablet(context) &&
      MediaQuery.of(context).orientation == Orientation.landscape;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 768) {
          return mobile;
        }
        if (constraints.maxWidth > 768 && constraints.maxWidth < 1024) {
          return tablet ?? mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}

extension ResponsiveLayoutX on BuildContext {
  // Add these to your existing ResponsiveLayout class
  double get headerHeight => ResponsiveLayout.isMobile(this) ? 56.0 : 64.0;

  double get navItemSpacing => ResponsiveLayout.isMobile(this) ? 24.0 : 32.0;

  double get logoMarginLeft => ResponsiveLayout.isMobile(this) ? 16.0 : 24.0;
}
