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

class StudentMetric {
  const StudentMetric({
    required this.label,
    required this.value,
    required this.helper,
    required this.color,
    required this.icon,
  });

  final String label;
  final String value;
  final String helper;
  final Color color;
  final IconData icon;
}

class LearningPlan {
  const LearningPlan({
    required this.title,
    required this.tag,
    required this.mentor,
    required this.schedule,
    required this.progressLabel,
    required this.color,
  });

  final String title;
  final String tag;
  final String mentor;
  final String schedule;
  final String progressLabel;
  final Color color;
}

class BulletinItem {
  const BulletinItem({
    required this.title,
    required this.date,
    required this.tag,
    required this.description,
  });

  final String title;
  final String date;
  final String tag;
  final String description;
}

const studentMetrics = <StudentMetric>[
  StudentMetric(
    label: 'Attendance',
    value: '92%',
    helper: 'On track this month',
    color: AppColors.secondary,
    icon: Icons.task_alt_rounded,
  ),
  StudentMetric(
    label: 'Assignments',
    value: '18/20',
    helper: '2 waiting for review',
    color: AppColors.accent,
    icon: Icons.assignment_turned_in_outlined,
  ),
  StudentMetric(
    label: 'Mentoring',
    value: '6h',
    helper: 'Book next session',
    color: AppColors.primary,
    icon: Icons.headset_mic_rounded,
  ),
];

const learningPlans = <LearningPlan>[
  LearningPlan(
    title: 'UI Foundation & Research',
    tag: 'Batch 12',
    mentor: 'Mentor Rani Eka',
    schedule: 'Sen, 09:00 - 11:00 WIB',
    progressLabel: 'Pertemuan 6/12',
    color: Color(0xFFFFE6E0),
  ),
  LearningPlan(
    title: 'Interaction & Prototype',
    tag: 'Mini Sprint',
    mentor: 'Mentor Aditya',
    schedule: 'Rabu, 13:00 - 15:00 WIB',
    progressLabel: 'Pertemuan 3/8',
    color: Color(0xFFFFF1C6),
  ),
  LearningPlan(
    title: 'Career Preparation',
    tag: 'Coaching',
    mentor: 'Mentor Shinta',
    schedule: 'Jumat, 19:00 - 20:30 WIB',
    progressLabel: 'Pertemuan 1/4',
    color: Color(0xFFE3F7FB),
  ),
];

const bulletinItems = <BulletinItem>[
  BulletinItem(
    title: 'Penilaian Sprint 02 dibuka',
    date: '18 Desember 2024',
    tag: 'Akademik',
    description: 'Upload hasil studi kasus maksimal Jumat pukul 23.00 WIB melalui LMS.',
  ),
  BulletinItem(
    title: 'Sesi sharing dengan alumni',
    date: '20 Desember 2024',
    tag: 'Komunitas',
    description: 'Belajar strategi interview dengan Alumni Batch 08. Daftar sebelum 19 Des.',
  ),
];
