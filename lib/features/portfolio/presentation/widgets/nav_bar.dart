import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_downloader.dart';
import '../../../../core/utils/responsive.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  double _turns = 0.0;

  void _rotate() {
    setState(() => _turns += 0.5);
  }

  void _unRotate() {
    setState(() => _turns -= 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white10)),
        color: AppColors.navBackground,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isMobile(context) ? 20 : 60,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => setState(() => _rotate()),
            onExit: (event) => setState(() => _unRotate()),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: _turns,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.terminal,
                    color: AppColors.primary,
                    size: ResponsiveLayout.isMobile(context)
                        ? 0.07.dp
                        : ResponsiveLayout.isTablet(context)
                        ? 0.08.dp
                        : 0.09.dp,
                  ),
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: ResponsiveLayout.isMobile(context)
                          ? 7.sp
                          : ResponsiveLayout.isTablet(context)
                          ? 9.sp
                          : 11.sp,
                    ),
                    children: [
                      TextSpan(
                        text: "JVM ",
                        style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      TextSpan(
                        text: "_SYS",
                        style: GoogleFonts.jetBrainsMono(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!ResponsiveLayout.isMobile(context))
            Row(
              children: [
                NavItem('._systems'),
                NavItem('._experience'),
                NavItem('._tech_arsenal'),
                NavItem('._metrics'),
              ],
            ),
          if (ResponsiveLayout.isMobile(context))
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            )
          else
            FilledButton(
              onPressed: () => downloadFile(
                'assets/documents/JONATHAN_MARK_MWIGO_RESUME.pdf',
              ),
              child: Text(
                "Resume.pdf",
                style: GoogleFonts.jetBrainsMono(
                  fontSize: context.responsiveBodySmall,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;

  const NavItem(this.title, {super.key});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (event) => setState(() => isHovered = false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.title,
            style: GoogleFonts.jetBrainsMono(
              color: isHovered ? AppColors.primary : Colors.white54,
              fontSize: context.responsiveBodySmall,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
