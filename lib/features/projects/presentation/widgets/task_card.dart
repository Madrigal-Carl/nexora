import 'package:flutter/material.dart';

import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/app/theme/app_text_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.onTap, required this.task});

  final VoidCallback? onTap;
  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(task.status.icon, color: task.status.color),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body,
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Text(task.priority.label, style: AppTextStyles.bodySmall),

                      const SizedBox(width: 6),

                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 6),

                      Text(task.dueDate, style: AppTextStyles.bodySmall),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: task.status.color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(task.status.label, style: AppTextStyles.bodySmall),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem {
  final String title;
  final String description;
  final TaskStatus status;
  final TaskPriority priority;
  final String dueDate;

  TaskItem({
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.dueDate,
  });
}

enum TaskStatus { completed, ongoing, pending, overdue }

extension TaskStatusExtension on TaskStatus {
  String get label {
    switch (this) {
      case TaskStatus.completed:
        return 'Completed';

      case TaskStatus.ongoing:
        return 'Ongoing';

      case TaskStatus.pending:
        return 'Pending';

      case TaskStatus.overdue:
        return 'Overdue';
    }
  }

  Color get color {
    switch (this) {
      case TaskStatus.completed:
        return AppColors.success;

      case TaskStatus.ongoing:
        return AppColors.primary;

      case TaskStatus.pending:
        return AppColors.priority;

      case TaskStatus.overdue:
        return AppColors.danger;
    }
  }

  IconData get icon {
    switch (this) {
      case TaskStatus.completed:
        return Icons.check_circle;

      case TaskStatus.ongoing:
        return Icons.play_circle_fill;

      case TaskStatus.pending:
        return Icons.schedule;

      case TaskStatus.overdue:
        return Icons.warning_amber_rounded;
    }
  }
}

enum TaskPriority { high, medium, low }

extension TaskPriorityExtension on TaskPriority {
  String get label {
    switch (this) {
      case TaskPriority.high:
        return 'High';

      case TaskPriority.medium:
        return 'Medium';

      case TaskPriority.low:
        return 'Low';
    }
  }

  Color get color {
    switch (this) {
      case TaskPriority.high:
        return AppColors.danger;

      case TaskPriority.medium:
        return AppColors.priority;

      case TaskPriority.low:
        return AppColors.success;
    }
  }
}
