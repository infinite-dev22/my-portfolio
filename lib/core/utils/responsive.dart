import 'package:flutter/material.dart';

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

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 420;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1290 &&
      MediaQuery.of(context).size.width > 420;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1290;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 450) {
          return mobile;
        }
        if (constraints.maxWidth > 450 && constraints.maxWidth < 1000) {
          return tablet ?? mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
