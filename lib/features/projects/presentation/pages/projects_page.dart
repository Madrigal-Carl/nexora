import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/header.dart';
import '../../../../shared/widgets/kpi_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            const Header(
              title: 'Projects',
              subtitle: 'Organize and track all your projects',
            ),
            Row(
              children: [
                Expanded(
                  child: KpiCard(
                    icon: Icons.folder_open,
                    iconColor: AppColors.primary,
                    name: 'Projects',
                    number: '8',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiCard(
                    icon: Icons.assignment,
                    iconColor: AppColors.priority,
                    name: 'Tasks',
                    number: '24',
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
