import 'package:flutter/material.dart';
import 'responsive.dart';

extension ResponsiveText on BuildContext {
  double get responsiveDisplayLarge => ResponsiveLayout.isMobile(this)
      ? 48
      : ResponsiveLayout.isTablet(this)
      ? 64
      : 80;

  double get responsiveDisplayMedium => ResponsiveLayout.isMobile(this)
      ? 32
      : ResponsiveLayout.isTablet(this)
      ? 40
      : 48;

  double get responsiveDisplaySmall => ResponsiveLayout.isMobile(this)
      ? 24
      : ResponsiveLayout.isTablet(this)
      ? 28
      : 32;

  double get responsiveHeadlineLarge => ResponsiveLayout.isMobile(this)
      ? 24
      : ResponsiveLayout.isTablet(this)
      ? 28
      : 32;

  double get responsiveHeadlineMedium => ResponsiveLayout.isMobile(this)
      ? 20
      : ResponsiveLayout.isTablet(this)
      ? 24
      : 28;

  double get responsiveBodyLarge => ResponsiveLayout.isMobile(this) ? 16 : 18;

  double get responsiveBodyMedium => ResponsiveLayout.isMobile(this) ? 14 : 16;

  double get responsiveBodySmall => ResponsiveLayout.isMobile(this) ? 12 : 14;

  double get responsiveLabelLarge => ResponsiveLayout.isMobile(this) ? 14 : 16;

  double get responsiveLabelSmall => ResponsiveLayout.isMobile(this) ? 10 : 12;

  // Special cases for massive text
  double get responsiveMassive => ResponsiveLayout.isMobile(this)
      ? 80
      : ResponsiveLayout.isTablet(this)
      ? 140
      : 200;
}
