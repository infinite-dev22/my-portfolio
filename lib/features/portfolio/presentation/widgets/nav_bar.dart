import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

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
          Row(
            children: [
              const Icon(Icons.terminal, color: AppColors.primary, size: 24),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.2,
                  ),
                  children: [
                    TextSpan(
                      text: "JVM ",
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: "_SYS",
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isMobile(context))
            Row(
              children: [
                _navItem('._systems'),
                _navItem('._experience'),
                _navItem('._tech_arsenal'),
                _navItem('._metrics'),
              ],
            ),
          if (ResponsiveLayout.isMobile(context))
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            )
          else
            FilledButton(
              onPressed: () {},
              child: Text("Resume.pdf", style: GoogleFonts.jetBrainsMono()),
            ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: GoogleFonts.jetBrainsMono(
          color: Colors.white54,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
