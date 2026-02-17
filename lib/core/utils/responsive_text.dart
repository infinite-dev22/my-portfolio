import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/responsive.dart';

/// 🎯 RESPONSIVE TEXT SIZES
/// Clean, scalable naming (small → xxlarge) for maintainability
/// All values in LOGICAL PIXELS (web-safe, no .sp/.dp)
///
/// USAGE PATTERN:
/// Text("Content", style: TextStyle(fontSize: context.textLarge))
extension ResponsiveText on BuildContext {
  // ===== PRIVATE HELPER: Reduce repetition =====
  double _getSize(double mobile, double tablet, double desktop) {
    return ResponsiveLayout.isMobile(this) ? mobile
        : ResponsiveLayout.isTablet(this) ? tablet
        : desktop;
  }

  // ===== DISPLAY SIZES (Hero/Headline text) =====

  /// USE: Main hero title ("Jonathan Mark Mwigo: I Build Systems...")
  /// Mobile: 36px | Tablet: 42px | Desktop: 48px
  double get textXxlarge => _getSize(36.0, 42.0, 48.0);

  /// USE: Hero subtitle ("Senior Mobile & Backend Lead specializing...")
  /// Mobile: 16px | Tablet: 18px | Desktop: 20px
  double get textXlarge => _getSize(16.0, 18.0, 20.0);

  /// USE: Section headers ("3x Lead Experience", "Backend Systems")
  /// Mobile: 24px | Tablet: 26px | Desktop: 28px
  double get textLarge => _getSize(24.0, 26.0, 28.0);

  /// USE: Sub-section headers ("Strategy & Lead", "Connect to Host.")
  /// Mobile: 20px | Tablet: 22px | Desktop: 24px
  double get textMediumLarge => _getSize(20.0, 22.0, 24.0);

  // ===== BODY SIZES (Content text) =====

  /// USE: Organization names ("Hyde Innovations", "Netlify IT")
  /// Mobile: 18px | Tablet: 19px | Desktop: 20px
  double get textMedium => _getSize(18.0, 19.0, 20.0);

  /// USE: Role titles ("Senior Lead Mobile & Backend"), button text
  /// Mobile: 14px | Tablet: 15px | Desktop: 16px
  double get textRegular => _getSize(14.0, 15.0, 16.0);

  /// USE: Body descriptions, terminal commands, code blocks
  /// Mobile: 14px | Tablet: 14px | Desktop: 14px
  double get textSmall => _getSize(14.0, 14.0, 14.0);

  /// USE: Timeline dates ("2021 – PRESENT"), tech labels, stat labels
  /// Mobile: 12px | Tablet: 12.5px | Desktop: 13px
  double get textXsmall => _getSize(12.0, 12.5, 13.0);

  /// USE: Footer text, quote captions, metadata
  /// Mobile: 11px | Tablet: 11.5px | Desktop: 12px
  double get textXxsmall => _getSize(11.0, 11.5, 12.0);

  // ===== SPECIALIZED SIZES =====

  /// USE: Logo text ("JMM _SYS")
  /// Mobile: 16px | Tablet: 17px | Desktop: 18px
  double get textLogo => _getSize(16.0, 17.0, 18.0);

  /// USE: Navigation links ("/systems", "/experience")
  /// Mobile: 14px | Tablet: 15px | Desktop: 16px
  double get textNav => _getSize(14.0, 15.0, 16.0);

  /// USE: Resume button text
  /// Mobile: 14px | Tablet: 15px | Desktop: 14px
  double get textButton => _getSize(14.0, 15.0, 14.0);

  /// USE: Stat numbers ("20%", "10,000+", "40%")
  /// Mobile: 32px | Tablet: 36px | Desktop: 40px
  double get textStat => _getSize(32.0, 36.0, 40.0);

  /// USE: Terminal prompt ("> whois jonathan")
  /// Mobile: 14px | Tablet: 15px | Desktop: 15px
  double get textTerminal => _getSize(14.0, 15.0, 15.0);

  /// USE: Code blocks (`pub struct System { ... }`)
  /// Mobile: 13px | Tablet: 14px | Desktop: 14px
  double get textCode => _getSize(13.0, 14.0, 14.0);
}