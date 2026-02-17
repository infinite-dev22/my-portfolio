import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';
import 'package:portfolio_app/core/utils/responsive_widget.dart';

/// TECH STACK BAR (Rust, Kotlin, Java etc.)
class TechStackBar extends StatelessWidget {
  final String tech;
  final String category;
  final Color color;
  final double progress; // 0.0 to 1.0

  const TechStackBar({
    super.key,
    required this.tech,
    required this.category,
    required this.color,
    this.progress = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                tech,
                style: TextStyle(
                  fontSize: context.textButton,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Text(
              category,
              style: TextStyle(
                fontSize: context.textStat,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        SizedBox(height: context.responsiveSpaceXs),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[800],
          minHeight: 4,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ],
    );
  }
}
