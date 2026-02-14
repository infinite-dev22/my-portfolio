import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/theme/app_colors.dart';

class PortfolioCodeEditor extends StatelessWidget {
  final String fileName;
  final Widget child;

  const PortfolioCodeEditor({
    super.key,
    required this.fileName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Terminal Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              border: Border.all(color: Colors.white10),
              color: AppColors.editorHead,
            ),
            child: Row(
              mainAxisAlignment: .start,
              spacing: 20,
              children: [
                Row(
                  mainAxisSize: .min,
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Color(0xFFFF5F56),
                      size: 12,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.circle,
                      color: Color(0xFFFFBD2E),
                      size: 12,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.circle,
                      color: Color(0xFF27C93F),
                      size: 12,
                    ),
                  ],
                ),
                Text(
                  fileName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.editorTitle,
                    fontSize: 12,
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
              color: AppColors.editorBody,
            ),
            child: Row(
              children: [
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
