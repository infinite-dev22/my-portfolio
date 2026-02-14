import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/portfolio_entities.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/theme/app_colors.dart';

class StatsSection extends StatelessWidget {
  final List<Stat> stats;

  const StatsSection({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white10)),
        color: AppColors.statsBackground,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
        vertical: 80,
      ),
      child: ResponsiveLayout(
        mobile: Column(
          children: stats
              .map(
                (stat) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: _StatCard(stat: stat),
                ),
              )
              .toList(),
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: stats
              .map((stat) => Expanded(child: _StatCard(stat: stat)))
              .toList(),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final Stat stat;

  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(40),
      decoration: ShapeDecoration(
        color: AppColors.statsCard,
        shape: RoundedSuperellipseBorder(
          side: BorderSide(color: Colors.white10),
          borderRadius: BorderRadius.circular(24),)
      ),
      child: Column(
        children: [
          Text(
            stat.value,
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white,
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            stat.label,
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white54,
              fontSize: 18,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "METRIC_ID: ${stat.description}",
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              color: stat.descriptionColor,
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
