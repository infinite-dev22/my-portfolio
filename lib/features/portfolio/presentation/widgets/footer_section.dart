import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
        vertical: 60,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white10)),
        color: AppColors.footerBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveLayout(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoColumn(context),
                const SizedBox(height: 60),
                _buildContactForm(context),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildInfoColumn(context)),
                const SizedBox(width: 80),
                _buildContactForm(context),
              ],
            ),
          ),
          const SizedBox(height: 120),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          ResponsiveLayout(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "© ${DateTime.now().year} JONATHAN MARK MWIGO. ALL SYSTEMS OPERATIONAL.",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSubSecondary,
                    fontSize: context.textXxsmall,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "LATENCY: 14ms  UPTIME: 99.998%",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSubSecondary,
                    fontSize: context.textXxsmall,
                  ),
                ),
              ],
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "© ${DateTime.now().year} JONATHAN MARK MWIGO. ALL SYSTEMS OPERATIONAL.",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSubSecondary,
                    fontSize: context.textXxsmall,
                  ),
                ),
                Text(
                  "LATENCY: 14ms  UPTIME: 99.998%",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textSubSecondary,
                    fontSize: context.textXxsmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Connect to Host.",
          style: GoogleFonts.jetBrainsMono(
            color: Colors.white,
            fontSize: context.textLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Currently open to technical leadership roles and\nhigh-scale architecture consulting.",
          style: GoogleFonts.inter(
            color: AppColors.textSecondary,
            fontSize: context.textSmall,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 48),
        ResponsiveLayout(
          mobile: Column(
            spacing: 16,
            children: [
              _socialLink("LinkedIn/Jonathan-Mark-Mwigo", context),
              _socialLink("GitHub/infinite-dev22", context),
            ],
          ),
          tablet: Row(
            spacing: 32,
            children: [
              _socialLink("LinkedIn/Jonathan-Mark-Mwigo", context),
              _socialLink("GitHub/infinite-dev22", context),
            ],
          ),
          desktop: Row(
            spacing: 32,
            children: [
              _socialLink("LinkedIn/Jonathan-Mark-Mwigo", context),
              _socialLink("GitHub/infinite-dev22", context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      width: ResponsiveLayout.isMobile(context) ? double.infinity : 400,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ENCRYPTED TRANSMISSION VIA HTTPS/TLS 1.3",
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.textSubSecondary,
              fontSize: context.textXxsmall,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF16181D),
              hintText: "name@company.com",
              hintStyle: GoogleFonts.jetBrainsMono(
                color: Colors.white24,
                fontSize: context.textXsmall,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
            style: GoogleFonts.jetBrainsMono(color: Colors.white, fontSize: 14),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Text("Send Message", style: GoogleFonts.jetBrainsMono()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLink(String text, BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.link, color: Colors.white54, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.textSecondary,
            fontSize: context.textXsmall,
          ),
        ),
      ],
    );
  }
}
