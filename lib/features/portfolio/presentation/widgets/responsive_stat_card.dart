
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/utils/responsive_text.dart';
import 'package:portfolio_app/core/utils/responsive_widget.dart';

class ResponsiveStatCard extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const ResponsiveStatCard({
    super.key,
    required this.number,
    required this.label,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.responsiveCardPadding),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(context.responsiveButtonRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: context.responsiveSpaceSm,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: context.textStat,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: context.textSmall,
              color: Colors.grey[400],
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}