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
                ? double.infinity
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
      ],
    );

    return SafeArea(
      top: includeTopPadding,
      bottom: true,
      child: content,
    );
  }
}
