import 'package:flutter/material.dart';

import '../../app/theme/app_text_styles.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(title, style: AppTextStyles.headingMedium),
        Text(subtitle, style: AppTextStyles.bodySmall),
      ],
    );
  }
}
