import 'package:flutter/material.dart';
import '../theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        final notification = _notifications[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: notification.isUnread
                      ? AppColors.primary.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.icon,
                  color: notification.isUnread ? AppColors.primary : Colors.grey,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Text(
                          notification.time,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.message,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final bool isUnread;

  const _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    this.isUnread = false,
  });
}

final List<_NotificationItem> _notifications = [
  const _NotificationItem(
    title: 'Tugas Baru: UI Design',
    message: 'Tugas "Redesign App" telah ditambahkan ke kelas UI Design.',
    time: '2 jam yang lalu',
    icon: Icons.assignment_outlined,
    isUnread: true,
  ),
  const _NotificationItem(
    title: 'Pengingat: Jadwal Mentoring',
    message: 'Jangan lupa sesi mentoring dengan Kak Rani besok jam 10.00.',
    time: '5 jam yang lalu',
    icon: Icons.access_time,
    isUnread: true,
  ),
  const _NotificationItem(
    title: 'Nilai Keluar',
    message: 'Nilai untuk tugas "Wireframing" sudah dipublikasikan.',
    time: 'Kemarin',
    icon: Icons.grade_outlined,
    isUnread: false,
  ),
  const _NotificationItem(
    title: 'Update Materi',
    message: 'Materi baru tentang "Auto Layout" telah tersedia.',
    time: '2 hari yang lalu',
    icon: Icons.book_outlined,
    isUnread: false,
  ),
];
