import 'package:flutter/material.dart';

import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/app/theme/app_text_styles.dart';
import 'package:nexora/shared/widgets/header.dart';
import 'package:nexora/shared/widgets/kpi_card.dart';
import 'package:nexora/shared/widgets/project_card.dart';
import 'project_details_page.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  void _showCreateProjectModal(BuildContext context) {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            0,
            20,
            MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Project', style: AppTextStyles.headingMedium),

              const SizedBox(height: 20),

              Text('Project Name', style: AppTextStyles.label),

              const SizedBox(height: 8),

              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter project name',
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        final name = controller.text.trim();

                        if (name.isEmpty) return;

                        Navigator.pop(context);
                      },
                      child: const Text('Create'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'Nexora Mobile App',
        'totalTasks': 12,
        'completedTasks': 7,
        'tasks': [
          ProjectTaskPreview(
            title: 'Create login screen',
            priority: Priority.high,
          ),
          ProjectTaskPreview(
            title: 'Setup API integration',
            priority: Priority.medium,
          ),
          ProjectTaskPreview(
            title: 'Create dashboard UI',
            priority: Priority.low,
          ),
          ProjectTaskPreview(
            title: 'Add notifications',
            priority: Priority.high,
          ),
        ],
      },
      {
        'name': 'Website Redesign',
        'totalTasks': 8,
        'completedTasks': 3,
        'tasks': [
          ProjectTaskPreview(
            title: 'Create wireframes',
            priority: Priority.medium,
          ),
          ProjectTaskPreview(
            title: 'Design landing page',
            priority: Priority.high,
          ),
          ProjectTaskPreview(
            title: 'Review typography',
            priority: Priority.low,
          ),
        ],
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
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

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _showCreateProjectModal(context),
                icon: const Icon(Icons.add),
                label: const Text('Create Project'),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProjectCard(
                      projectName: project['name'] as String,
                      totalTasks: project['totalTasks'] as int,
                      completedTasks: project['completedTasks'] as int,
                      tasks: project['tasks'] as List<ProjectTaskPreview>,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProjectDetailPage(
                              projectName: project['name'] as String,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
