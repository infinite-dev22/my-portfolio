import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/portfolio_entities.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
            vertical: 80,
          ),
          decoration: BoxDecoration(color: AppColors.experienceBackground),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "3x Lead Experience",
                style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveLayout.isMobile(context) ? 24 : 32,
                ),
              ),
              SizedBox(
                width: 80,
                child: const Divider(color: AppColors.primary, thickness: 4),
              ),
              const SizedBox(height: 40),
              ResponsiveLayout(
                mobile: Column(
                  children: [
                    _CurrentExperienceCard(),
                    _PreviousExperienceCard(),
                    _OldExperienceCard(),
                    const SizedBox(height: 24),
                    const _PhilosophyCard(),
                  ],
                ),
                desktop: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: _CurrentExperienceCard(), // Hyde
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 2,
                          child: _PreviousExperienceCard(), // Infosec
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _OldExperienceCard(), // Netify
                        ),
                        const SizedBox(width: 24),
                        const Expanded(
                          flex: 4,
                          child: _PhilosophyCard(), // Quote
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PhilosophyCard extends StatelessWidget {
  const _PhilosophyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350, // Match height of experience cards roughly
      padding: const EdgeInsets.all(60),
      decoration: ShapeDecoration(
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF0c2643), const Color(0xFF221a17)],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "SCALE",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white24,
                fontSize: 200,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: .center,
              children: [
                Text(
                  "LEADERSHIP PHILOSOPHY",
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white54,
                    fontSize: 18,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "\"Infrastructure is useless\nwithout a culture that knows\nhow to maintain it.\"",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
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
        height: 350,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "2024 - PRESENT",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Senior Lead Mobile & Backend",
              style: GoogleFonts.jetBrainsMono(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
                children: [
                  TextSpan(
                    text: "Architecting mission-critical infrastructure using ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: "Kotlin",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ", ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: "Flutter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ", ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: "Rust/Actix",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        ". Focused on creating resilient backend systems that support low-latency mobile interactions.",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
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
        height: 350,
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
          spacing: 16,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Infosec Technologies",
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lead Developer",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "2024 - 2024",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 8,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      MingCute.check_circle_fill,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                    Text(
                      "Managed a 3-person core development team.",
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      MingCute.check_circle_fill,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                    Text(
                      "Reduced production bugs by 30% via CI/CD pipelines.",
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        height: 1.6,
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
                      fontWeight: FontWeight.bold,
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

class _OldExperienceCard extends StatefulWidget {
  const _OldExperienceCard();

  @override
  State<_OldExperienceCard> createState() => _OldExperienceCardState();
}

class _OldExperienceCardState extends State<_OldExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: Container(
        height: 350,
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mobile Application Consultant and Lead",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
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
                          fontWeight: FontWeight.bold,
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
