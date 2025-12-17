import 'package:flutter/material.dart';

import '../data/lms_data.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isHome = _navIndex == 0;
    return Scaffold(
      backgroundColor: isHome ? AppColors.primary : AppColors.background,
      extendBodyBehindAppBar: isHome,
      appBar: isHome ? null : _buildAppBar(),
      body: IndexedStack(
        index: _navIndex,
        children: [
          _HomeTabContent(onAccountTap: _openAccountDialog),
          const DashboardBody(includeTopPadding: false),
          const _ComingSoonTab(
            title: 'Forum Komunitas',
            description: 'Tempat diskusi tugas, update kegiatan cohort, dan info lomba.',
            icon: Icons.forum_outlined,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 74,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book_rounded), label: 'Belajar'),
          NavigationDestination(icon: Icon(Icons.forum_outlined), selectedIcon: Icon(Icons.forum_rounded), label: 'Komunitas'),
        ],
        selectedIndex: _navIndex,
        onDestinationSelected: (value) => setState(() => _navIndex = value),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    switch (_navIndex) {
      case 1:
        return AppBar(title: const Text('Modul Belajar'), actions: _defaultActions);
      case 2:
        return AppBar(title: const Text('Forum Komunitas'), actions: _defaultActions);
      default:
        return AppBar(title: const Text('Lumi LMS'), actions: _defaultActions);
    }
  }

  List<Widget> get _defaultActions => [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: _AccountButton(onTap: _openAccountDialog),
        ),
      ];

  Future<void> _openAccountDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Akun saya',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    CircleAvatar(radius: 26, backgroundColor: AppColors.primary, child: Text('AL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Alesha Paramita', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 4),
                          Text('hello@lumi.design', style: TextStyle(color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  label: 'Logout',
                  icon: Icons.logout_rounded,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tutup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent({required this.onAccountTap});

  final VoidCallback onAccountTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HomeHeader(onAccountTap: onAccountTap),
                    const SizedBox(height: 20),
                    const _ProgramCard(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(title: 'Status belajar', actionLabel: 'Lihat rapor'),
                      SizedBox(height: 16),
                      _MetricGrid(),
                      SizedBox(height: 28),
                      _SectionHeader(title: 'Kelas aktif', actionLabel: 'Lihat semua'),
                      SizedBox(height: 16),
                      _LearningPlanList(),
                      SizedBox(height: 28),
                      _SectionHeader(title: 'Jadwal hari ini', actionLabel: 'Lihat kalender'),
                      SizedBox(height: 16),
                      _ScheduleList(),
                      SizedBox(height: 28),
                      _SectionHeader(title: 'Buletin kampus', actionLabel: 'Lihat lainnya'),
                      SizedBox(height: 16),
                      _BulletinList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.onAccountTap});

  final VoidCallback onAccountTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Alesha 👋',
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.white.withOpacity(.75)),
              ),
              const SizedBox(height: 4),
              Text(
                'Batch UI/UX Product Design 2024',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onAccountTap,
          child: const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Text(
              'AL',
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}

class _AccountButton extends StatelessWidget {
  const _AccountButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(
        backgroundColor: AppColors.primary,
        child: Text('AL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  const _ProgramCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Program UI/UX Intensif',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Sesi berikutnya Sen • 09.00 WIB • Studio Hybrid',
                  style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 14),
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _TagChip(label: 'Batch 12'),
                    _TagChip(label: 'Hybrid class'),
                    _TagChip(label: 'Mentor Rani'),
                  ],
                ),
                const SizedBox(height: 18),
                PrimaryButton(
                  label: 'Mulai kelas',
                  icon: Icons.arrow_forward_rounded,
                  expanded: false,
                  onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                ),
              ],
            ),
          ),
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(.25),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(Icons.play_circle_outline, size: 46, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        double cardWidth;
        if (maxWidth > 720) {
          cardWidth = (maxWidth - 24) / 3;
        } else if (maxWidth > 460) {
          cardWidth = (maxWidth - 12) / 2;
        } else {
          cardWidth = maxWidth;
        }
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: studentMetrics
              .map((metric) => SizedBox(width: cardWidth, child: _MetricCard(metric: metric)))
              .toList(),
        );
      },
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.metric});

  final StudentMetric metric;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: metric.color.withOpacity(.18),
            child: Icon(metric.icon, color: metric.color),
          ),
          const SizedBox(height: 12),
          Text(
            metric.value,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            metric.label,
            style: theme.textTheme.labelLarge?.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            metric.helper,
            style: theme.textTheme.labelMedium?.copyWith(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _LearningPlanList extends StatelessWidget {
  const _LearningPlanList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: learningPlans
          .map((plan) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _LearningPlanTile(plan: plan),
              ))
          .toList(),
    );
  }
}

class _LearningPlanTile extends StatelessWidget {
  const _LearningPlanTile({required this.plan});

  final LearningPlan plan;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: plan.color,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(plan.mentor, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.schedule_rounded, size: 18, color: AppColors.primaryDark),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        plan.schedule,
                        style: theme.textTheme.labelMedium?.copyWith(color: AppColors.primaryDark, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  plan.tag,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                plan.progressLabel,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: todaysSchedule
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _ScheduleCard(item: item),
              ))
          .toList(),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primary.withOpacity(.12),
            child: Text(
              item.avatar,
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.course,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  item.time,
                  style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: AppColors.muted),
                  const SizedBox(width: 4),
                  Text(
                    item.location,
                    style: theme.textTheme.labelSmall?.copyWith(color: AppColors.muted),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Hadiri',
                  style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BulletinList extends StatelessWidget {
  const _BulletinList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bulletinItems
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _BulletinCard(item: item),
              ))
          .toList(),
    );
  }
}

class _BulletinCard extends StatelessWidget {
  const _BulletinCard({required this.item});

  final BulletinItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
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
                  item.title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              _TagChip(label: item.tag),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.description,
            style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.calendar_month_outlined, size: 16, color: AppColors.primaryDark),
              const SizedBox(width: 6),
              Text(
                item.date,
                style: theme.textTheme.labelMedium?.copyWith(color: AppColors.primaryDark, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.actionLabel});

  final String title;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        TextButton(onPressed: () {}, child: Text(actionLabel)),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

class _ComingSoonTab extends StatelessWidget {
  const _ComingSoonTab({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 44,
                backgroundColor: AppColors.primary.withOpacity(.1),
                child: Icon(icon, color: AppColors.primary, size: 36),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
