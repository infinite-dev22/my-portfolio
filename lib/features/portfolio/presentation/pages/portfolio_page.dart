import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntax_highlight/src/highlighter.dart';
import '../bloc/portfolio_bloc.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/who_is_jonathan_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/stats_section.dart';
import '../widgets/footer_section.dart';

class PortfolioPage extends StatelessWidget {
  final Highlighter codeHighlighter;

  const PortfolioPage({super.key, required this.codeHighlighter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state.status == PortfolioStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == PortfolioStatus.error) {
            return Center(
              child: Text(state.errorMessage ?? 'An error occurred'),
            );
          } else if (state.status == PortfolioStatus.loaded &&
              state.portfolioData != null) {
            final data = state.portfolioData!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const NavBar(),
                  HeroSection(
                    profile: data.profile,
                    highlighter: codeHighlighter,
                  ),
                  const WhoIsJonathanSection(), // Inserted WhoIsJonathanSection
                  ExperienceSection(experiences: data.experiences),
                  SkillsSection(skills: data.skills),
                  StatsSection(stats: data.stats),
                  const FooterSection(),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
