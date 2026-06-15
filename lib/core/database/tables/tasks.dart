import 'package:drift/drift.dart';

enum TaskStatus { pending, ongoing, completed, overdue }

enum TaskPriority { low, medium, high }

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get projectId => integer()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  TextColumn get status =>
      textEnum<TaskStatus>().withDefault(Constant(TaskStatus.pending.name))();

  TextColumn get priority => textEnum<TaskPriority>().withDefault(
    Constant(TaskPriority.medium.name),
  )();

  DateTimeColumn get dueDate => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}
