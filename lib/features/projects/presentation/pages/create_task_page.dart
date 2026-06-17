import 'package:flutter/material.dart';

import 'package:nexora/app/theme/app_colors.dart';
import 'package:nexora/app/theme/app_text_styles.dart';
import '../widgets/task_card.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key, required this.projectName});

  final String projectName;

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? dueDate;
  TaskPriority priority = TaskPriority.medium;

  Future<void> pickDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selected != null) {
      setState(() {
        dueDate = selected;
      });
    }
  }

  String get formattedDate {
    if (dueDate == null) return 'mm/dd/yyyy';

    return '${dueDate!.month.toString().padLeft(2, '0')}/'
        '${dueDate!.day.toString().padLeft(2, '0')}/'
        '${dueDate!.year}';
  }

  void saveTask() {
    // TODO: implement save logic
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER (consistent with ProjectDetailPage)
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('Add Task', style: AppTextStyles.headingMedium),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                'PROJECT: ${widget.projectName.toUpperCase()}',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.textSecondary,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                width: 48,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              const SizedBox(height: 24),

              /// FORM
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Title',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'What needs to be done?',
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Due Date',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  InkWell(
                    onTap: pickDate,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              formattedDate,
                              style: dueDate == null
                                  ? AppTextStyles.body.copyWith(
                                      color: AppColors.textSecondary,
                                    )
                                  : AppTextStyles.body,
                            ),
                          ),
                          const Icon(Icons.calendar_month_outlined, size: 20),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Priority',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _PriorityCard(
                        label: 'Low',
                        icon: Icons.arrow_downward_rounded,
                        selected: priority == TaskPriority.low,
                        onTap: () => setState(() {
                          priority = TaskPriority.low;
                        }),
                      ),
                      const SizedBox(width: 10),
                      _PriorityCard(
                        label: 'Medium',
                        icon: Icons.horizontal_rule_rounded,
                        selected: priority == TaskPriority.medium,
                        onTap: () => setState(() {
                          priority = TaskPriority.medium;
                        }),
                      ),
                      const SizedBox(width: 10),
                      _PriorityCard(
                        label: 'High',
                        icon: Icons.priority_high_rounded,
                        selected: priority == TaskPriority.high,
                        onTap: () => setState(() {
                          priority = TaskPriority.high;
                        }),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Description (Optional)',
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'Add more details about this task...',
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: saveTask,
                      child: const Text('Save Task'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PriorityCard extends StatelessWidget {
  const _PriorityCard({
    required this.label,
    required this.selected,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 96,
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withValues(alpha: .10)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: selected ? AppColors.primary : AppColors.textSecondary,
              ),

              const SizedBox(height: 10),

              Text(
                label,
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: selected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
