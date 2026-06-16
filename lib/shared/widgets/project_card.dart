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
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.folder_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    projectName,
                    style: AppTextStyles.headingSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Text(
                  '${(progress * 100).round()}%',
                  style: AppTextStyles.label,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              '$completedTasks of $totalTasks tasks completed',
              style: AppTextStyles.bodySmall,
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),

            if (tasks.isNotEmpty) ...[
              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...tasks
                      .take(2)
                      .map(
                        (task) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: task.priority.color,
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SizedBox(width: 6),

                              Text(task.title, style: AppTextStyles.bodySmall),
                            ],
                          ),
                        ),
                      ),

                  if (tasks.length > 2)
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
                        '+${tasks.length - 2}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                ],
              ),
            ],
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
