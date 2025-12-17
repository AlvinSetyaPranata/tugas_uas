import 'package:flutter/material.dart';

import '../theme.dart';

class Course {
  const Course({
    required this.title,
    required this.category,
    required this.teacher,
    required this.progress,
    required this.color,
  });

  final String title;
  final String category;
  final String teacher;
  final double progress;
  final Color color;
}

class ScheduleItem {
  const ScheduleItem({
    required this.course,
    required this.time,
    required this.location,
    required this.avatar,
  });

  final String course;
  final String time;
  final String location;
  final String avatar;
}

class QuickStat {
  const QuickStat({
    required this.label,
    required this.value,
    required this.delta,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final String delta;
  final IconData icon;
  final Color color;
}

const featuredCourses = <Course>[
  Course(
    title: 'UI/UX Research Essentials',
    category: 'Design Sprint',
    teacher: 'Samantha Lee',
    progress: 0.65,
    color: AppColors.primary,
  ),
  Course(
    title: 'Advanced Motion Graphics',
    category: 'Animation',
    teacher: 'Andrew Porter',
    progress: 0.45,
    color: AppColors.accent,
  ),
  Course(
    title: 'Front-end Architecture',
    category: 'Web Dev',
    teacher: 'Lucia Torres',
    progress: 0.82,
    color: AppColors.secondary,
  ),
];

const todaysSchedule = <ScheduleItem>[
  ScheduleItem(
    course: 'Design Critique Session',
    time: '09:30 - 11:00 AM',
    location: 'Room Aurora',
    avatar: 'SL',
  ),
  ScheduleItem(
    course: 'React Native Workshop',
    time: '12:30 - 02:00 PM',
    location: 'Room Nova',
    avatar: 'AP',
  ),
  ScheduleItem(
    course: 'Career Coaching',
    time: '03:00 - 04:00 PM',
    location: 'Virtual',
    avatar: 'LT',
  ),
];

const quickStats = <QuickStat>[
  QuickStat(
    label: 'Active Courses',
    value: '12',
    delta: '+2 new',
    icon: Icons.menu_book_rounded,
    color: AppColors.primary,
  ),
  QuickStat(
    label: 'Completed Tasks',
    value: '34',
    delta: '+8 this week',
    icon: Icons.check_circle_rounded,
    color: AppColors.secondary,
  ),
  QuickStat(
    label: 'Mentor Hours',
    value: '18h',
    delta: '2 booked',
    icon: Icons.headset_mic_rounded,
    color: AppColors.accent,
  ),
];

const categories = <String>[
  'All',
  'Design',
  'Development',
  'Business',
  'Marketing',
  'Soft Skills',
];
