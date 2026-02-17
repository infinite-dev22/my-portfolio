import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/responsive.dart';

/// 🎯 COMPLETE RESPONSIVE WIDGET SYSTEM FOR YOUR DESIGN
/// Every dimension in your screenshot is covered:
/// - Header (JMM _SYS, nav links, resume button)
/// - Section spacing & cards
/// - Tech stack bars
/// - Stat cards
/// - Code blocks & terminal
/// - Footer & social
///
/// ✅ All values in LOGICAL PIXELS (fixed, not screen-proportional)
/// ✅ No .sp/.dp — web-safe and accessibility-compliant
/// ✅ Breakpoint-aware: mobile (<768), tablet (768–1024), desktop (≥1024)
extension ResponsiveWidget on BuildContext {
  // ===== HEADER LAYOUT =====
  double get responsiveHeaderHeight =>
      ResponsiveLayout.isMobile(this) ? 56.0
          : ResponsiveLayout.isTablet(this) ? 60.0
          : 64.0;

  double get responsiveLogoMarginLeft =>
      ResponsiveLayout.isMobile(this) ? 16.0
          : ResponsiveLayout.isTablet(this) ? 20.0
          : 24.0;

  double get responsiveNavSpacing =>
      ResponsiveLayout.isMobile(this) ? 24.0
          : ResponsiveLayout.isTablet(this) ? 28.0
          : 32.0;

  double get responsiveNavItemPadding =>
      ResponsiveLayout.isMobile(this) ? 12.0
          : ResponsiveLayout.isTablet(this) ? 16.0
          : 20.0;

  double get responsiveResumeButtonHeight =>
      ResponsiveLayout.isMobile(this) ? 40.0
          : ResponsiveLayout.isTablet(this) ? 44.0
          : 48.0;

  double get responsiveResumeButtonRadius =>
      ResponsiveLayout.isMobile(this) ? 8.0
          : ResponsiveLayout.isTablet(this) ? 10.0
          : 12.0;

  // ===== SECTION STRUCTURE =====
  double get responsiveSectionSpacing =>
      ResponsiveLayout.isMobile(this) ? 40.0
          : ResponsiveLayout.isTablet(this) ? 52.0
          : 64.0;

  double get responsiveCardPadding =>
      ResponsiveLayout.isMobile(this) ? 24.0
          : ResponsiveLayout.isTablet(this) ? 28.0
          : 32.0;

  double get responsiveCardRadius =>
      ResponsiveLayout.isMobile(this) ? 8.0
          : ResponsiveLayout.isTablet(this) ? 10.0
          : 12.0;

  // ===== TECH STACK LAYOUT =====
  double get responsiveTechIconSize =>
      ResponsiveLayout.isMobile(this) ? 16.0
          : ResponsiveLayout.isTablet(this) ? 18.0
          : 20.0;

  double get responsiveTechGap =>
      ResponsiveLayout.isMobile(this) ? 12.0
          : ResponsiveLayout.isTablet(this) ? 16.0
          : 20.0;

  double get responsiveTechBarHeight =>
      ResponsiveLayout.isMobile(this) ? 48.0
          : ResponsiveLayout.isTablet(this) ? 52.0
          : 56.0;

  // ===== STAT CARDS =====
  double get responsiveStatCardHeight =>
      ResponsiveLayout.isMobile(this) ? 120.0
          : ResponsiveLayout.isTablet(this) ? 140.0
          : 160.0;

  double get responsiveStatCardPadding =>
      ResponsiveLayout.isMobile(this) ? 24.0
          : ResponsiveLayout.isTablet(this) ? 28.0
          : 32.0;

  double get responsiveStatCardRadius =>
      ResponsiveLayout.isMobile(this) ? 12.0
          : ResponsiveLayout.isTablet(this) ? 16.0
          : 20.0;

  // ===== CODE & TERMINAL =====
  double get responsiveCodeLineHeight =>
      ResponsiveLayout.isMobile(this) ? 20.0
          : ResponsiveLayout.isTablet(this) ? 22.0
          : 24.0;

  double get responsiveTerminalHeight =>
      ResponsiveLayout.isMobile(this) ? 48.0
          : ResponsiveLayout.isTablet(this) ? 56.0
          : 64.0;

  double get responsiveTerminalPadding =>
      ResponsiveLayout.isMobile(this) ? 16.0
          : ResponsiveLayout.isTablet(this) ? 20.0
          : 24.0;

  // ===== BUTTONS & CTAs =====
  double get responsiveButtonHeight =>
      ResponsiveLayout.isMobile(this) ? 40.0
          : ResponsiveLayout.isTablet(this) ? 44.0
          : 48.0;

  double get responsiveButtonRadius =>
      ResponsiveLayout.isMobile(this) ? 8.0
          : ResponsiveLayout.isTablet(this) ? 10.0
          : 12.0;

  double get responsiveButtonMinWidth =>
      ResponsiveLayout.isMobile(this) ? 120.0
          : ResponsiveLayout.isTablet(this) ? 140.0
          : 160.0;

  // ===== FOOTER & SOCIAL =====
  double get responsiveFooterHeight =>
      ResponsiveLayout.isMobile(this) ? 64.0
          : ResponsiveLayout.isTablet(this) ? 72.0
          : 80.0;

  double get responsiveFooterPadding =>
      ResponsiveLayout.isMobile(this) ? 24.0
          : ResponsiveLayout.isTablet(this) ? 32.0
          : 40.0;

  double get responsiveSocialIconSize =>
      ResponsiveLayout.isMobile(this) ? 20.0
          : ResponsiveLayout.isTablet(this) ? 22.0
          : 24.0;

  // ===== SPACING UTILITY (Most used) =====
  double get responsiveSpaceXs =>
      ResponsiveLayout.isMobile(this) ? 4.0
          : ResponsiveLayout.isTablet(this) ? 6.0
          : 8.0;

  double get responsiveSpaceSm =>
      ResponsiveLayout.isMobile(this) ? 8.0
          : ResponsiveLayout.isTablet(this) ? 12.0
          : 16.0;

  double get responsiveSpaceMd =>
      ResponsiveLayout.isMobile(this) ? 16.0
          : ResponsiveLayout.isTablet(this) ? 24.0
          : 32.0;

  double get responsiveSpaceLg =>
      ResponsiveLayout.isMobile(this) ? 24.0
          : ResponsiveLayout.isTablet(this) ? 32.0
          : 48.0;

  double get responsiveSpaceXl =>
      ResponsiveLayout.isMobile(this) ? 32.0
          : ResponsiveLayout.isTablet(this) ? 48.0
          : 64.0;

  // ===== LAYOUT CONSTRAINTS =====
  double get responsiveMaxContentWidth =>
      ResponsiveLayout.isMobile(this) ? double.infinity
          : ResponsiveLayout.isTablet(this) ? 768.0
          : 1100.0; // Matches your content width

  double get responsiveSidebarWidth =>
      ResponsiveLayout.isMobile(this) ? 0.0
          : ResponsiveLayout.isTablet(this) ? 280.0
          : 320.0;
}