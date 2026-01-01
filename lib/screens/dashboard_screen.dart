import 'package:flutter/material.dart';

import '../data/lms_data.dart';
import '../theme.dart';
import '../widgets/course_card.dart';
import '../widgets/schedule_tile.dart';
import '../widgets/stat_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Overview'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          const SizedBox(width: 4),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Text('AL'),
            ),
          ),
        ],
      ),
      body: const DashboardBody(),
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key, this.includeTopPadding = true});

  final bool includeTopPadding;

  @override
  Widget build(BuildContext context) {
    final content = ListView(
      physics: const AlwaysScrollableScrollPhysics(), // Force scrollable
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final columns = width > 1000
                ? 3
                : width > 700
                    ? 2
                    : 1;
            final cardWidth = columns == 1
                ? width
                : (width - (16 * (columns - 1))) / columns;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: quickStats
                  .map(
                    (stat) => SizedBox(
                      width: cardWidth,
                      child: StatCard(stat: stat),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        const SizedBox(height: 32),
        Text(
          'Today focus',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        CourseCard(course: featuredCourses.first),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            TextButton(onPressed: () {}, child: const Text('View calendar')),
          ],
        ),
        const SizedBox(height: 12),
        ...todaysSchedule.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ScheduleTile(item: item),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.lightbulb_outline_rounded, color: AppColors.secondary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weekly insights',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Your consistency improved 12% compared to last week.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Completed modules', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 6),
                        Text('8 / 10', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Feedback score', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary)),
                        const SizedBox(height: 6),
                        Text('4.8', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All Classes Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list_rounded),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...allClassOverviews.map(
          (course) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ClassOverviewCard(course: course),
          ),
        ),
      ],
    );

    return SafeArea(
      top: includeTopPadding,
      bottom: true,
      child: content,
    );
  }
}

class _ClassOverviewCard extends StatelessWidget {
  const _ClassOverviewCard({required this.course});

  final ClassOverview course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = course.status == 'Completed';
    final isActive = course.status == 'Active';

    Color statusColor;
    if (isCompleted) {
      statusColor = Colors.green;
    } else if (isActive) {
      statusColor = AppColors.primary;
    } else {
      statusColor = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  course.title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  course.status,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${course.code} • ${course.credits} Credits • ${course.instructor}',
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress',
                          style: theme.textTheme.labelSmall?.copyWith(color: AppColors.textSecondary),
                        ),
                        Text(
                          '${(course.progress * 100).toInt()}%',
                          style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: course.progress,
                        minHeight: 6,
                        backgroundColor: AppColors.background,
                        valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                      ),
                    ),
                  ],
                ),
              ),
              if (course.grade > 0) ...[
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Grade',
                        style: theme.textTheme.labelSmall?.copyWith(fontSize: 10, color: AppColors.textSecondary),
                      ),
                      Text(
                        '${course.grade}',
                        style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
