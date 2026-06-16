import 'package:flutter/material.dart';

import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/app/theme/app_text_styles.dart';
import '../widgets/task_card.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key, required this.task});

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    final actionLabel = switch (task.status) {
      TaskStatus.pending => 'Start Task',
      TaskStatus.ongoing => 'Mark as Done',
      TaskStatus.overdue => 'Mark as Done',
      TaskStatus.completed => null,
    };

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 18,
            children: [
              /// HERO CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StatusBadge(label: task.status.label, color: Colors.white),
                    const SizedBox(height: 12),
                    Text(
                      task.title,
                      style: AppTextStyles.headingLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Manage and track task progress',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: .85),
                      ),
                    ),
                  ],
                ),
              ),

              /// OVERVIEW
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Text('Overview', style: AppTextStyles.headingMedium),
                  Text(
                    task.description,
                    style: AppTextStyles.body.copyWith(height: 1.7),
                  ),
                ],
              ),

              /// TASK DETAILS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Text('Task Details', style: AppTextStyles.headingMedium),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: [
                        _DetailRow(
                          icon: Icons.flag_rounded,
                          title: 'Priority',
                          value: task.priority.label,
                          valueColor: task.priority.color,
                        ),
                        const Divider(height: 1, color: AppColors.border),
                        _DetailRow(
                          icon: Icons.calendar_today_rounded,
                          title: 'Due Date',
                          value: task.dueDate,
                        ),
                        const Divider(height: 1, color: AppColors.border),
                        _DetailRow(
                          icon: Icons.track_changes_rounded,
                          title: 'Status',
                          value: task.status.label,
                          valueColor: task.status.color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// ACTION BUTTONS (NOW INSIDE BODY)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Back'),
                ),
              ),

              if (actionLabel != null) ...[
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      // TODO: Update task status
                    },
                    icon: Icon(
                      task.status == TaskStatus.pending
                          ? Icons.play_arrow_rounded
                          : Icons.check_rounded,
                    ),
                    label: Text(actionLabel),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.caption),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .18),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: AppTextStyles.label.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
