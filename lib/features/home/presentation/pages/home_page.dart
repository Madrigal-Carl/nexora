import 'package:flutter/material.dart';

import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/shared/widgets/header.dart';
import 'package:nexora/shared/widgets/kpi_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            Header(
              title: 'Overview',
              subtitle: 'Stay on top of your projects and deadlines',
            ),
            Row(
              children: [
                Expanded(
                  child: KpiCard(
                    icon: Icons.verified,
                    iconColor: AppColors.success,
                    name: 'Done Today',
                    number: '12',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiCard(
                    icon: Icons.dangerous,
                    iconColor: AppColors.danger,
                    name: 'Behind',
                    number: '3',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
