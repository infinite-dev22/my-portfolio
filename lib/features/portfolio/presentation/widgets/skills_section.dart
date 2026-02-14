import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/portfolio_entities.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    // Group skills by category
    final backendSkills = skills
        .where((s) => s.category == 'Backend Systems')
        .toList();
    final mobileSkills = skills
        .where((s) => s.category == 'Mobile / Frontend')
        .toList();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
        vertical: 60,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white10)),
        color: AppColors.skillsBackground,
      ),
      child: ResponsiveLayout(
        mobile: Column(
          children: [
            _SkillCategoryColumn(
              title: "Backend Systems",
              icon: FontAwesome.database_solid,
              skills: backendSkills,
              color: AppColors.secondary, // Orange
            ),
            const SizedBox(height: 60),
            _SkillCategoryColumn(
              title: "Mobile / Frontend",
              icon: MingCute.cellphone_fill,
              skills: mobileSkills,
              color: AppColors.primary, // Blue
            ),
            const SizedBox(height: 60),
            _buildStrategyColumn(),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _SkillCategoryColumn(
                title: "Backend Systems",
                icon: FontAwesome.database_solid,
                skills: backendSkills,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(width: 80),
            Expanded(
              child: _SkillCategoryColumn(
                title: "Mobile / Frontend",
                icon: MingCute.cellphone_fill,
                skills: mobileSkills,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 80),
            Expanded(child: _buildStrategyColumn()),
          ],
        ),
      ),
    );
  }

  Widget _buildStrategyColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedSuperellipseBorder(
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.white.withValues(alpha: 0.2),
                ),
              ),
              onPressed: null,
              icon: Icon(
                Icons.people_alt_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "Strategy & Lead",
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: const [
            _StrategyCard(
              icon: MingCute.directory_line,
              label: "SYSTEM DESIGN",
            ),
            _StrategyCard(icon: MingCute.cloud_2_line, label: "CLOUD OPS"),
            _StrategyCard(
              icon: MingCute.user_setting_line,
              label: "MENTORSHIP",
            ),
            _StrategyCard(
              icon: MingCute.trello_board_line,
              label: "AGILE JIRA",
            ),
          ],
        ),
      ],
    );
  }
}

class _SkillCategoryColumn extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Skill> skills;
  final Color color;

  const _SkillCategoryColumn({
    required this.title,
    required this.icon,
    required this.skills,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedSuperellipseBorder(
                    side: BorderSide(color: color.withValues(alpha: 0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  color.withValues(alpha: 0.2),
                ),
              ),
              onPressed: null,
              icon: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        ...skills.map(
          (skill) => Container(
            margin: EdgeInsets.only(bottom: 24.0),
            padding: const EdgeInsets.all(24.0),
            decoration: ShapeDecoration(
              color: AppColors.skillsCard,
              shape: RoundedSuperellipseBorder(
                side: BorderSide(color: Colors.white10),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      skill.name,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      skill.purpose, // Or some other detail if needed
                      style: GoogleFonts.jetBrainsMono(
                        color: color,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: skill.proficiency,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StrategyCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StrategyCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.skillsCard,
        shape: RoundedSuperellipseBorder(
          side: BorderSide(color: Colors.white10),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white70, size: 48),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
