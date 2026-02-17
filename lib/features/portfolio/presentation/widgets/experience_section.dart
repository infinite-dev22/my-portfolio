import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/portfolio_entities.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
        vertical: 80,
      ),
      decoration: BoxDecoration(color: AppColors.experienceBackground),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3x Lead Experience",
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontWeight: .bold,
                  fontSize: context.textLarge,
                ),
              ),
              SizedBox(
                width: 80,
                child: const Divider(color: AppColors.primary, thickness: 4),
              ),
              const SizedBox(height: 40),
              ResponsiveLayout(
                mobile: Column(
                  spacing: 24,
                  children: [
                    _CurrentExperienceCard(),
                    _PreviousExperienceCard(),
                    OldExperienceCard(),
                    const PhilosophyCard(),
                  ],
                ),
                desktop: Column(
                  spacing: 24,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24,
                      children: [
                        Expanded(
                          flex: 5,
                          child: _CurrentExperienceCard(), // Hyde
                        ),
                        Expanded(
                          flex: 3,
                          child: _PreviousExperienceCard(), // Infosec
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24,
                      children: [
                        Expanded(
                          flex: 3,
                          child: OldExperienceCard(), // Netify
                        ),
                        const Expanded(
                          flex: 4,
                          child: PhilosophyCard(), // Quote
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PhilosophyCard extends StatelessWidget {
  const PhilosophyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        constraints: BoxConstraints(minHeight: 350),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0c2643), Color(0xFF111827), Color(0xFF221a17)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(60),
        child: SizedBox(
          height: constraints.minHeight,
          child: Stack(
            children: [
              // Watermark text (behind content)
              Positioned.fill(
                child: Center(
                  child: Text(
                    "SCALE",
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.white12,
                      fontSize: ResponsiveLayout.isMobile(context)
                          ? 80
                          : ResponsiveLayout.isTablet(context)
                          ? 150
                          : 200,
                      letterSpacing: 2.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Primary content (centered)
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "LEADERSHIP PHILOSOPHY",
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white54,
                          fontSize: context.textXsmall,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '"Infrastructure is useless without a culture that knows how to maintain it."',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: context.textLarge,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurrentExperienceCard extends StatefulWidget {
  const _CurrentExperienceCard();

  @override
  State<_CurrentExperienceCard> createState() => _CurrentExperienceCardState();
}

class _CurrentExperienceCardState extends State<_CurrentExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: Container(
        constraints: BoxConstraints(minHeight: 350),
        // Fixed height for grid alignment
        padding: const EdgeInsets.all(32),
        decoration: ShapeDecoration(
          color: AppColors.experienceCard,
          shape: RoundedSuperellipseBorder(
            side: BorderSide(
              color: isHovered
                  ? AppColors.primary.withValues(alpha: 0.4)
                  : Colors.white10,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 80,
          children: [
            Column(
              spacing: 30,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Flexible(
                          child: Text(
                            "Hyde Innovations",
                            style: GoogleFonts.jetBrainsMono(
                              color: Colors.white,
                              fontSize: context.textMedium,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                        Text(
                          "2024 - PRESENT",
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.textSecondary,
                            fontSize: context.textXsmall,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Senior Lead Mobile & Backend",
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.primary,
                        fontSize: context.textRegular,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.jetBrainsMono(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: .bold,
                      height: 1.1,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Architecting mission-critical infrastructure using ",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: .w200,
                        ),
                      ),
                      TextSpan(
                        text: "Kotlin",
                        style: TextStyle(fontWeight: .bold),
                      ),
                      TextSpan(
                        text: ", ",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: .w200,
                        ),
                      ),
                      TextSpan(
                        text: "Flutter",
                        style: TextStyle(fontWeight: .bold),
                      ),
                      TextSpan(
                        text: ", and ",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: .w200,
                        ),
                      ),
                      TextSpan(
                        text: "Rust/Actix",
                        style: TextStyle(fontWeight: .bold),
                      ),
                      TextSpan(
                        text:
                            ". Focused on creating resilient backend systems that support low-latency mobile interactions.",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: .w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children:
                  [
                    "Rust/Axum",
                    "Kotlin/Jetpack Compose",
                    "Flutter",
                    "PostgreSQL",
                  ].take(4).map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        shape: RoundedSuperellipseBorder(
                          side: BorderSide(color: Colors.white10),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        tech,
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white60,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviousExperienceCard extends StatefulWidget {
  const _PreviousExperienceCard();

  @override
  State<_PreviousExperienceCard> createState() =>
      _PreviousExperienceCardState();
}

class _PreviousExperienceCardState extends State<_PreviousExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: Container(
        constraints: BoxConstraints(minHeight: 350),
        // Fixed height for grid alignment
        padding: const EdgeInsets.all(32),
        decoration: ShapeDecoration(
          color: AppColors.experienceCard,
          shape: RoundedSuperellipseBorder(
            side: BorderSide(
              color: isHovered
                  ? AppColors.secondary.withValues(alpha: 0.4)
                  : Colors.white10,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Infosec Technologies",
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: context.textMedium,
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  "Lead Developer",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.secondary,
                    fontSize: context.textRegular,
                    fontWeight: .w500,
                  ),
                ),
                Text(
                  "2024 - 2024",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSecondary,
                    fontSize: context.textXsmall,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 8,
              mainAxisSize: .min,
              children: [
                Row(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  spacing: 8,
                  children: [
                    Icon(
                      MingCute.check_circle_fill,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Managed a 3-person core development team.",
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Icon(
                      MingCute.check_circle_fill,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Reduced production bugs by 30% via CI/CD pipelines.",
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.white10),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "30%",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 32,
                      fontWeight: .bold,
                      color: AppColors.secondary,
                    ),
                  ),
                  Text(
                    "BUG REDUCTION",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 16,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OldExperienceCard extends StatefulWidget {
  const OldExperienceCard({super.key});

  @override
  State<OldExperienceCard> createState() => _OldExperienceCardState();
}

class _OldExperienceCardState extends State<OldExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: Container(
        constraints: BoxConstraints(minHeight: 350),
        // Fixed height for grid alignment
        padding: const EdgeInsets.all(32),
        decoration: ShapeDecoration(
          color: AppColors.experienceCard,
          shape: RoundedSuperellipseBorder(
            side: BorderSide(
              color: isHovered
                  ? AppColors.primary.withValues(alpha: 0.4)
                  : Colors.white10,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Netify IT",
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: context.textMedium,
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  "Mobile Application Consultant and Lead",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.primary,
                    fontSize: context.textRegular,
                    fontWeight: .w500,
                  ),
                ),
              ],
            ),
            Text(
              "Revitalized legacy mobile applications. Spearheaded the migration to a modern reactive architecture, resulting in massive engagement gains.",
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
                fontSize: 16,
                height: 1.6,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: RoundedSuperellipseBorder(
                  side: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.1),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                spacing: 20,
                children: [
                  IconButton(
                    iconSize: 38,
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedSuperellipseBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    onPressed: null,
                    icon: Icon(
                      MingCute.trending_up_line,
                      color: AppColors.primary,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "40%",
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 20,
                          fontWeight: .bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        "Increase in DAU",
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
