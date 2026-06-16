import 'package:flutter/material.dart';
import 'package:nexora/app/theme/app_text_styles.dart';
import 'package:nexora/app/theme/app_colors.dart';

class KpiCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String name;
  final String number;

  const KpiCard({
    super.key,
    required this.icon,
    required this.name,
    required this.number,
    this.iconColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Icon(icon, color: iconColor),
              Text(name, style: AppTextStyles.caption),
            ],
          ),
          Text(number, style: AppTextStyles.headingMedium),
        ],
      ),
    );
  }
}
