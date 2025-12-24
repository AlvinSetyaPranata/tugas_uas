import 'package:flutter/material.dart';

import '../data/lms_data.dart';
import '../theme.dart';
import '../widgets/primary_button.dart';

class LearningDetailScreen extends StatelessWidget {
  const LearningDetailScreen({super.key, required this.plan});

  final LearningPlan plan;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final modules = _modulesByPlan[plan.title] ?? _defaultModules;
    final references = _referencesByPlan[plan.title] ?? _defaultReferences;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            backgroundColor: plan.color,
            automaticallyImplyLeading: true,
            title: const Text('Detail kelas'),
            titleSpacing: 0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 24, right: 24, bottom: 18),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.tag,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plan.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [plan.color, plan.color.withOpacity(.6), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, bottom: 40),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.85),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plan.progressLabel,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            plan.schedule,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.labelLarge?.copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
            sliver: SliverList.list(
              children: [
                _PrimaryInfoCard(plan: plan),
                const SizedBox(height: 24),
                Text('Ringkasan program', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                Text(
                  'Sesi difokuskan untuk memperdalam ${plan.title.toLowerCase()} dengan praktik terarah. Peserta akan mendapatkan feedback langsung dari ${plan.mentor} dan akses referensi yang dibagikan selama kelas.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(26),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Target capaian', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      ..._goals
                          .map(
                            (goal) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.check_circle_rounded, size: 18, color: AppColors.primary),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(goal, style: theme.textTheme.bodyMedium),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text('Modul pembelajaran', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                ...modules
                    .asMap()
                    .entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _ModuleTile(index: entry.key + 1, module: entry.value),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 8),
                PrimaryButton(
                  label: 'Mulai sesi berikutnya',
                  icon: Icons.play_arrow_rounded,
                  onPressed: () {},
                  expanded: true,
                ),
                const SizedBox(height: 28),
                Text('Referensi kelas', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                ...references
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _ReferenceCard(item: item),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryInfoCard extends StatelessWidget {
  const _PrimaryInfoCard({required this.plan});

  final LearningPlan plan;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.person_rounded,
            label: 'Mentor',
            value: plan.mentor,
          ),
          const Divider(height: 24),
          _InfoRow(
            icon: Icons.calendar_month_rounded,
            label: 'Jadwal',
            value: plan.schedule,
          ),
          const Divider(height: 24),
          _InfoRow(
            icon: Icons.flag_circle_rounded,
            label: 'Progress',
            value: plan.progressLabel,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: AppColors.primaryDark),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ModuleTile extends StatelessWidget {
  const _ModuleTile({required this.index, required this.module});

  final int index;
  final _LearningModule module;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primary.withOpacity(.12),
            child: Text(
              index.toString().padLeft(2, '0'),
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  module.title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.schedule_rounded, size: 16, color: AppColors.muted),
                    const SizedBox(width: 6),
                    Text(module.duration, style: theme.textTheme.labelMedium?.copyWith(color: AppColors.muted)),
                    const SizedBox(width: 18),
                    const Icon(Icons.file_present_rounded, size: 16, color: AppColors.muted),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        module.deliverable,
                        style: theme.textTheme.labelMedium?.copyWith(color: AppColors.muted),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReferenceCard extends StatelessWidget {
  const _ReferenceCard({required this.item});

  final _ReferenceItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(item.icon, color: AppColors.primaryDark),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(item.description, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('Buka')),
        ],
      ),
    );
  }
}

class _LearningModule {
  const _LearningModule({required this.title, required this.duration, required this.deliverable});

  final String title;
  final String duration;
  final String deliverable;
}

class _ReferenceItem {
  const _ReferenceItem({required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;
}

const _defaultModules = <_LearningModule>[
  _LearningModule(
    title: 'Pemahaman masalah & objective',
    duration: '30 menit',
    deliverable: 'Problem statement & success metric',
  ),
  _LearningModule(
    title: 'Riset cepat & sintesis',
    duration: '60 menit',
    deliverable: 'Insight clustering',
  ),
  _LearningModule(
    title: 'Eksplorasi solusi & prototyping',
    duration: '90 menit',
    deliverable: 'Clickable prototype',
  ),
];

const _defaultReferences = <_ReferenceItem>[
  _ReferenceItem(
    title: 'Template riset Lumi',
    description: 'Gunakan untuk menuliskan temuan studi lapangan.',
    icon: Icons.description_outlined,
  ),
  _ReferenceItem(
    title: 'Library komponen Figma',
    description: 'Komponen resmi yang digunakan selama sprint UI.',
    icon: Icons.auto_awesome_mosaic_rounded,
  ),
  _ReferenceItem(
    title: 'Contoh studi kasus batch 11',
    description: 'Pelajari struktur jawaban yang lulus dengan nilai A.',
    icon: Icons.collections_bookmark_outlined,
  ),
];

const _goals = <String>[
  'Memetakan kebutuhan pengguna menggunakan kerangka riset singkat.',
  'Menyusun prioritas fitur berdasarkan impact-effort.',
  'Membuat prototype fidelitas menengah lengkap dengan alur utama.',
];

final _modulesByPlan = <String, List<_LearningModule>>{
  'UI Foundation & Research': const [
    _LearningModule(title: 'Pendalaman persona & journey', duration: '45 menit', deliverable: 'Journey map per persona'),
    _LearningModule(title: 'Metode usability guerilla', duration: '60 menit', deliverable: 'Checklist sesi uji coba'),
    _LearningModule(title: 'Storytelling insight', duration: '45 menit', deliverable: 'Narasi temuan & rekomendasi'),
  ],
  'Interaction & Prototype': const [
    _LearningModule(title: 'Menyusun flow kritikal', duration: '40 menit', deliverable: 'Flowchart interaksi'),
    _LearningModule(title: 'Desain microinteraction', duration: '50 menit', deliverable: 'Dokumentasi state & animasi'),
    _LearningModule(title: 'Usability checklist', duration: '35 menit', deliverable: 'Checklist heuristik'),
  ],
};

final _referencesByPlan = <String, List<_ReferenceItem>>{
  'UI Foundation & Research': const [
    _ReferenceItem(title: 'Kit Research Ops', description: 'Template screener, script, dan notulasi.', icon: Icons.playbook_rounded),
    _ReferenceItem(title: 'Workbook Insight Synth', description: 'Langkah clustering dan prioritas temuan.', icon: Icons.auto_graph_rounded),
  ],
  'Interaction & Prototype': const [
    _ReferenceItem(title: 'UI Motion Library', description: 'Preset easing & durasi untuk mobile.', icon: Icons.movie_filter_rounded),
    _ReferenceItem(title: 'Guide handoff ke dev', description: 'Checklist asset & annotation sebelum rilis.', icon: Icons.integration_instructions_rounded),
  ],
};
