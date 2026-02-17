import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class WhoIsJonathanSection extends StatefulWidget {
  const WhoIsJonathanSection({super.key});

  @override
  State<WhoIsJonathanSection> createState() => _WhoIsJonathanSectionState();
}

class _WhoIsJonathanSectionState extends State<WhoIsJonathanSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
        vertical: 80,
      ),
      decoration: BoxDecoration(color: AppColors.whoisJonathanBackground),
      child: Center(
        child: Container(
          width: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1E1E1E),
                const Color(0xFF1E1E1E).withValues(alpha: 0.95),
              ],
            ),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Terminal Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  border: Border(bottom: BorderSide(color: Colors.white10)),
                  color: AppColors.terminalHead,
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        const Icon(
                          Icons.terminal_rounded,
                          color: AppColors.terminalTitle,
                          size: 12,
                        ),
                        Text(
                          'zsh - mwigo@systems-lead',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.terminalTitle,
                            fontSize: context.responsiveBodySmall,
                          ),
                        ),
                        const SizedBox(width: 40), // Balance the icons
                      ],
                    ),
                    Text(
                      'ACTIVE SESSION',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.terminalHeadActive,
                        fontSize: context.responsiveBodySmall,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),
              // Terminal Content
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(color: Colors.white10),
                  color: AppColors.terminalBody,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: context.responsiveBodySmall,
                          height: 1.6,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "❯ ",
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: context.responsiveBodyLarge,
                            ),
                          ),
                          TextSpan(
                            text: "whois jonathan\n\n",
                            style: GoogleFonts.jetBrainsMono(),
                          ),

                          TextSpan(
                            text: "[PHILOSOPHY.sh] ",
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Transitioning from deep JVM roots to Rust-based performance systems. I believe in the \"Write Once, Run Efficiently\" mantra.\n\n",
                            style: GoogleFonts.jetBrainsMono(),
                          ),

                          TextSpan(
                            text: "I build systems where ",
                            style: GoogleFonts.jetBrainsMono(),
                          ),
                          TextSpan(
                            text: "Reliability ",
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "meets ",
                            style: GoogleFonts.jetBrainsMono(),
                          ),
                          TextSpan(
                            text: "Performance",
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                ". Specializing in high-throughput JVM architectures and Reactive UIs that don't compromise on speed.\n\n",
                            style: GoogleFonts.jetBrainsMono(),
                          ),

                          TextSpan(
                            text: "Executing Lead_Mentorship.v2 ... ",
                            style: GoogleFonts.jetBrainsMono(),
                          ),
                          TextSpan(
                            text: "DONE",
                            style: GoogleFonts.jetBrainsMono(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          "❯ ",
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: context.responsiveBodyLarge,
                          ),
                        ),
                        RepaintBoundary(
                          child: FadeTransition(
                            opacity: _cursorController,
                            child: Container(
                              width: 10,
                              height: 20,
                              color: Colors.white,
                            ),
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
      ),
    );
  }
}
