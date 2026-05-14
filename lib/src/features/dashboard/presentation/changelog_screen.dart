import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../theme/app_theme.dart';

class ChangelogScreen extends StatelessWidget {
  const ChangelogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHANGE LOG'),
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildVersion(
            context,
            '1.1.0',
            'May 14, 2026',
            [
              'Smart Auto-Plan: Interleaved subject distribution across training nights.',
              'Backup & Restore: Cross-platform JSON backup with web download support.',
              'Stability Patch: Resolved critical enum-based crashes on Flutter Web.',
              'Reset Tool: New "Clear All Lessons" feature for rapid schedule iteration.',
              'UI Polish: Improved icon visibility and snackbar feedback.',
            ],
            isLatest: true,
          ),
          const SizedBox(height: 24),
          _buildVersion(
            context,
            '1.0.1',
            'May 13, 2026',
            [
              'Instructor and Location Deconfliction: Visual indicators for busy staff and rooms.',
              'Unique EO Codes: Phase-specific suffixes for all lessons (e.g., M100-P1).',
              'Glassmorphism Aesthetics: Premium blurred transparency for cards and headers.',
              'Multi-Theme Support: Light, Dark, Sea, and System themes.',
              'Help Center: Searchable documentation system.',
            ],
          ),
          const SizedBox(height: 24),
          _buildVersion(
            context,
            '1.0.0',
            'May 12, 2026',
            [
              'Initial release of the Training Officer Tool.',
              'Academic Calendar with automated parade night generation.',
              'Training Matrix for 4-phase planning.',
              'Lesson Library with Sea Cadet EOs.',
              'Stats Dashboard for yearly progress tracking.',
              'PDF Routine Order generation.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVersion(BuildContext context, String version, String date, List<String> changes, {bool isLatest = false}) {
    return GlassContainer(
      opacity: 0.05,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VERSION $version',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.primary),
              ),
              if (isLatest)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'LATEST',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          Text(
            date.toUpperCase(),
            style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3), letterSpacing: 1),
          ),
          const SizedBox(height: 16),
          ...changes.map((change) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                Expanded(
                  child: Text(
                    change,
                    style: const TextStyle(fontSize: 13, height: 1.4),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
