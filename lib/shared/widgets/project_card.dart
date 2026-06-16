import 'package:flutter/material.dart';
import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/app/theme/app_text_styles.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectName,
    required this.totalTasks,
    required this.completedTasks,
    required this.tasks,
    this.onTap,
  });

  final String projectName;
  final int totalTasks;
  final int completedTasks;
  final List<ProjectTaskPreview> tasks;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final progress = totalTasks == 0 ? 0.0 : completedTasks / totalTasks;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.folder_rounded,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectName,
                        style: AppTextStyles.headingSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 2),

                      Text(
                        '$completedTasks of $totalTasks tasks completed',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${(progress * 100).round()}%',
                    style: AppTextStyles.label,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),

            const SizedBox(height: 18),

            /// Tasks Preview
            ...tasks
                .take(3)
                .map(
                  (task) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: task.priority.color,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            task.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

            if (tasks.length > 3)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '+${tasks.length - 3} more tasks',
                  style: AppTextStyles.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ProjectTaskPreview {
  final String title;
  final Priority priority;

  ProjectTaskPreview({required this.title, required this.priority});
}

enum Priority { high, medium, low }

extension PriorityColor on Priority {
  Color get color {
    switch (this) {
      case Priority.high:
        return AppColors.danger;

      case Priority.medium:
        return AppColors.priority;

      case Priority.low:
        return AppColors.success;
    }
  }
}
