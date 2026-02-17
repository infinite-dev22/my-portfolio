import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio_app/core/ui/background_pattern.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';
import 'package:portfolio_app/features/portfolio/presentation/widgets/code_editor.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_downloader.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/portfolio_entities.dart';

class HeroSection extends StatefulWidget {
  final Profile profile;
  final Highlighter highlighter;

  const HeroSection({
    super.key,
    required this.profile,
    required this.highlighter,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  late final TextSpan _highlightedCode;

  static const _codeString = '''
   01   /**
   02    * Jonathan – performance-focused engineer.
   03    * Strategy: validate SLO → optimize CPU
   04    * paths → enable cache → tune concurrency.
   05    */
   06   public class Jonathan implements Engineer {
   07   
   08       private final SystemSpec system;
   09   
   10       @Override
   11       public void scale() throws ScaleException {
   12   
   13           // Guard clauses (fail fast)
   14           if (system.throughput() <= 0)
   15               throw new ScaleException("Invalid throughput");
   16           if (system.reliability() < 99.0)
   17               throw new ScaleException("SLO below threshold");
   18   
   19           optimizeHotLoops();   // reduce allocations, avoid boxing
   20           enableCaching();      // e.g., Redis for read-heavy paths
   21           tuneThreadPools();    // align threads with CPU cores
   22       }
   23   }
    ''';

  @override
  void initState() {
    super.initState();
    _highlightedCode = widget.highlighter.highlight(_codeString);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveLayout.isMobile(context) ? 20 : 100,
          vertical: 60,
        ),
        child: ResponsiveLayout(
          mobile: Column(
            children: [
              _buildTextContent(context),
              const SizedBox(height: 40),
              _buildTerminal(context),
            ],
          ),
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: _buildTextContent(context)),
              const SizedBox(width: 80),
              Expanded(flex: 1, child: _buildTerminal(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PulsatingDot(),
              const SizedBox(width: 8),
              Text(
                'SYSTEM_STATUS: ACTIVE',
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.primary,
                  fontSize: context.textXxsmall,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        RichText(
          text: TextSpan(
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white,
              fontSize: context.textXxlarge,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
            children: [
              TextSpan(text: "${widget.profile.name}: "),
              const TextSpan(
                text: "I Build Systems That Scale ",
                style: TextStyle(color: AppColors.primary),
              ),
              const TextSpan(text: "and Teams That Last."),
            ],
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white,
              fontSize: context.textXlarge,
              height: 1.1,
            ),
            children: [
              TextSpan(
                text: "Senior Mobile & Backend Lead specializing in ",
                style: TextStyle(color: AppColors.textSecondary),
              ),
              TextSpan(
                text: "high-throughput JVM architectures",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Theme.of(context).primaryColor,
                ),
              ),
              TextSpan(
                text: ", Rust systems, and reactive UIs.",
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        Wrap(
          runSpacing: 16,
          children: [
            FilledButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: () {},
              icon: const Icon(Icons.insert_chart_rounded, size: 18),
              label: Text(
                "View Systems",
                style: GoogleFonts.jetBrainsMono(fontSize: context.textButton),
              ),
            ),
            const SizedBox(width: 24),
            OutlinedButton.icon(
              iconAlignment: IconAlignment.end,
              onPressed: () => downloadFile(
                'assets/documents/JONATHAN_MARK_MWIGO_RESUME.pdf',
              ),
              icon: Icon(MingCute.download_2_line, size: 18),
              label: Text(
                "Download Resume",
                style: GoogleFonts.jetBrainsMono(fontSize: context.textButton),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTerminal(BuildContext context) {
    return Stack(
      children: [
        PortfolioCodeEditor(
          fileName: "ArchitectureV3.java",
          child: Text.rich(
            _highlightedCode,
            style: GoogleFonts.jetBrainsMono(fontSize: context.textXsmall),
          ),
        ),
        if (!ResponsiveLayout.isMobile(context))
          Positioned(bottom: 20, right: 20, child: PacketTraffic())
        else
          Positioned(top: 55, right: 10, child: PacketTraffic()),
      ],
    );
  }
}

class PacketTraffic extends StatelessWidget {
  const PacketTraffic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.2),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10,
        children: [
          Text(
            "PACKET_TRAFFIC",
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 5,
              children: [
                _bar(20, AppColors.primary.withValues(alpha: 0.3)),
                _bar(40, AppColors.primary.withValues(alpha: 0.4)),
                _bar(30, AppColors.primary.withValues(alpha: 0.3)),
                _bar(60, AppColors.primary.withValues(alpha: 0.6)),
                _bar(45, AppColors.primary.withValues(alpha: 0.45)),
                _bar(55, AppColors.primary.withValues(alpha: 0.55)),
                _bar(70, AppColors.primary.withValues(alpha: 0.9)),
                _bar(30, AppColors.primary.withValues(alpha: 0.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar(double height, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: 15,
      height: height,
      color: color,
    );
  }
}

class PulsatingDot extends StatefulWidget {
  const PulsatingDot({super.key});

  @override
  State<PulsatingDot> createState() => _PulsatingDotState();
}

class _PulsatingDotState extends State<PulsatingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(); // This ensures it restarts from the beginning, creating the "outward" effect
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // The Pulsating Outer Ring
            Transform.scale(
              // Animates scale from 1.0 to 3.0
              scale: 1.0 + (_controller.value * 2.0),
              child: Opacity(
                // Animates opacity from 1.0 down to 0.0
                opacity: 1.0 - _controller.value,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            // The Static Inner Dot
            Container(
              width: 9,
              height: 9,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    );
  }
}
