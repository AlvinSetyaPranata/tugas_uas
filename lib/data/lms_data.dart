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

class ClassOverview {
  const ClassOverview({
    required this.title,
    required this.code,
    required this.instructor,
    required this.progress,
    required this.grade,
    required this.status,
    required this.schedule,
    required this.credits,
  });

  final String title;
  final String code;
  final String instructor;
  final double progress;
  final int grade;
  final String status;
  final String schedule;
  final int credits;
}

const allClassOverviews = <ClassOverview>[
  ClassOverview(
    title: 'UI Foundation & Research',
    code: 'UI-101',
    instructor: 'Rani Eka',
    progress: 0.5,
    grade: 88,
    status: 'Active',
    schedule: 'Sen, 09:00',
    credits: 3,
  ),
  ClassOverview(
    title: 'Interaction & Prototype',
    code: 'UX-202',
    instructor: 'Aditya',
    progress: 0.35,
    grade: 92,
    status: 'Active',
    schedule: 'Rabu, 13:00',
    credits: 4,
  ),
  ClassOverview(
    title: 'Career Preparation',
    code: 'CP-300',
    instructor: 'Shinta',
    progress: 0.25,
    grade: 0, // Not graded yet
    status: 'Active',
    schedule: 'Jumat, 19:00',
    credits: 2,
  ),
  ClassOverview(
    title: 'Design Systems',
    code: 'UI-205',
    instructor: 'Budi Santoso',
    progress: 0.0,
    grade: 0,
    status: 'Upcoming',
    schedule: 'Selasa, 10:00',
    credits: 3,
  ),
  ClassOverview(
    title: 'User Testing Methods',
    code: 'UX-301',
    instructor: 'Sarah Jenkins',
    progress: 0.0,
    grade: 0,
    status: 'Upcoming',
    schedule: 'Kamis, 14:00',
    credits: 3,
  ),
  ClassOverview(
    title: 'Visual Design Basics',
    code: 'VD-101',
    instructor: 'Michael Chen',
    progress: 1.0,
    grade: 95,
    status: 'Completed',
    schedule: '-',
    credits: 3,
  ),
  ClassOverview(
    title: 'Intro to Psychology',
    code: 'PSY-110',
    instructor: 'Dr. Linda',
    progress: 1.0,
    grade: 89,
    status: 'Completed',
    schedule: '-',
    credits: 2,
  ),
  ClassOverview(
    title: 'Digital Marketing 101',
    code: 'MKT-200',
    instructor: 'Peter Parker',
    progress: 0.8,
    grade: 78,
    status: 'Active',
    schedule: 'Sabtu, 09:00',
    credits: 3,
  ),
  ClassOverview(
    title: 'Web Accessibility',
    code: 'DEV-202',
    instructor: 'Ayu Lestari',
    progress: 0.1,
    grade: 0,
    status: 'Active',
    schedule: 'Senin, 13:00',
    credits: 2,
  ),
];

const featuredCourses = <Course>[
  Course(
    title: 'Esensi Riset UI/UX',
    category: 'Design Sprint',
    teacher: 'Samantha Lee',
    progress: 0.65,
    color: AppColors.primary,
  ),
  Course(
    title: 'Motion Graphics Lanjutan',
    category: 'Animasi',
    teacher: 'Andrew Porter',
    progress: 0.45,
    color: AppColors.accent,
  ),
  Course(
    title: 'Arsitektur Front-end',
    category: 'Web Dev',
    teacher: 'Lucia Torres',
    progress: 0.82,
    color: AppColors.secondary,
  ),
];

const todaysSchedule = <ScheduleItem>[
  ScheduleItem(
    course: 'Sesi Kritik Desain',
    time: '09:30 - 11:00 WIB',
    location: 'Ruang Aurora',
    avatar: 'SL',
  ),
  ScheduleItem(
    course: 'Workshop React Native',
    time: '12:30 - 14:00 WIB',
    location: 'Ruang Nova',
    avatar: 'AP',
  ),
  ScheduleItem(
    course: 'Bimbingan Karir',
    time: '15:00 - 16:00 WIB',
    location: 'Virtual',
    avatar: 'LT',
  ),
];

const quickStats = <QuickStat>[
  QuickStat(
    label: 'Kelas Aktif',
    value: '12',
    delta: '+2 baru',
    icon: Icons.menu_book_rounded,
    color: AppColors.primary,
  ),
  QuickStat(
    label: 'Tugas Selesai',
    value: '34',
    delta: '+8 minggu ini',
    icon: Icons.check_circle_rounded,
    color: AppColors.secondary,
  ),
  QuickStat(
    label: 'Jam Mentoring',
    value: '18j',
    delta: '2 dipesan',
    icon: Icons.headset_mic_rounded,
    color: AppColors.accent,
  ),
];

const categories = <String>[
  'Semua',
  'Desain',
  'Pengembangan',
  'Bisnis',
  'Pemasaran',
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
    label: 'Kehadiran',
    value: '92%',
    helper: 'Aman bulan ini',
    color: AppColors.secondary,
    icon: Icons.task_alt_rounded,
  ),
  StudentMetric(
    label: 'Tugas',
    value: '18/20',
    helper: '2 menunggu review',
    color: AppColors.accent,
    icon: Icons.assignment_turned_in_outlined,
  ),
  StudentMetric(
    label: 'Mentoring',
    value: '6j',
    helper: 'Jadwalkan sesi',
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
