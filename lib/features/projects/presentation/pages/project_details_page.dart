import 'package:flutter/material.dart';

import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/shared/widgets/header.dart';
import 'package:nexora/shared/widgets/kpi_card.dart';
import '../widgets/task_card.dart';
import 'task_detail_page.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, required this.projectName});

  final String projectName;

  @override
  Widget build(BuildContext context) {
    final tasks = [
      TaskItem(
        title: 'Create login screen',
        description:
            'Implement the login UI and connect it to the authentication service.',
        status: TaskStatus.completed,
        priority: TaskPriority.high,
        dueDate: 'Today',
      ),
      TaskItem(
        title: 'Setup API integration',
        description:
            'Implement the login UI and connect it to the authentication service.',
        status: TaskStatus.ongoing,
        priority: TaskPriority.medium,
        dueDate: 'Tomorrow',
      ),
      TaskItem(
        title: 'Create dashboard UI',
        description:
            'Implement the login UI and connect it to the authentication service.',
        status: TaskStatus.pending,
        priority: TaskPriority.low,
        dueDate: 'Jun 20',
      ),
      TaskItem(
        title: 'Fix payment validation bug',
        description:
            'Implement the login UI and connect it to the authentication service.',
        status: TaskStatus.overdue,
        priority: TaskPriority.high,
        dueDate: 'Jun 10',
      ),
      TaskItem(
        title: 'Implement notifications',
        description:
            'Implement the login UI and connect it to the authentication service.',
        status: TaskStatus.ongoing,
        priority: TaskPriority.medium,
        dueDate: 'Jun 22',
      ),
    ];

    final completed = tasks
        .where((e) => e.status == TaskStatus.completed)
        .length;

    final ongoing = tasks.where((e) => e.status == TaskStatus.ongoing).length;

    final pending = tasks.where((e) => e.status == TaskStatus.pending).length;

    final overdue = tasks.where((e) => e.status == TaskStatus.overdue).length;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Header(
                    title: projectName,
                    subtitle: 'Manage tasks and track progress',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: KpiCard(
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.success,
                    name: 'Completed',
                    number: '$completed',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiCard(
                    icon: Icons.play_circle_outline,
                    iconColor: AppColors.primary,
                    name: 'Ongoing',
                    number: '$ongoing',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: KpiCard(
                    icon: Icons.schedule,
                    iconColor: AppColors.priority,
                    name: 'Pending',
                    number: '$pending',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: KpiCard(
                    icon: Icons.warning_amber_rounded,
                    iconColor: AppColors.danger,
                    name: 'Overdue',
                    number: '$overdue',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  // show create task modal
                },
                icon: const Icon(Icons.add),
                label: const Text('New Task'),
              ),
            ),

            const SizedBox(height: 16),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TaskDetailPage(task: tasks[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
