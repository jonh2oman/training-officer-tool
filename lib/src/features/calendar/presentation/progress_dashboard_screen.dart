import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../domain/training_session.dart';
import '../../lessons/domain/lesson.dart';
import '../../../theme/app_theme.dart';

class ProgressDashboardScreen extends StatelessWidget {
  final List<TrainingSession> sessions;

  const ProgressDashboardScreen({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    final phaseStats = _calculateStats();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'YEARLY PROGRESS OVERVIEW',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppTheme.gold,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: Phase.values.length,
          itemBuilder: (context, index) {
            final phase = Phase.values[index];
            final stats = phaseStats[phase]!;
            return _PhaseProgressCard(phase: phase, stats: stats);
          },
        ),
        const SizedBox(height: 32),
        Text(
          'MANDATORY LESSON BREAKDOWN',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppTheme.gold,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...Phase.values.map((phase) => _PhaseDetailSection(
          phase: phase,
          lessons: LessonLibrary.getLessonsForPhase(phase).where((l) => l.isMandatory).toList(),
          scheduledCounts: _getScheduledCountsForPhase(phase),
        )),
      ],
    );
  }

  Map<Phase, _PhaseStats> _calculateStats() {
    final Map<Phase, _PhaseStats> stats = {
      for (var phase in Phase.values) phase: _PhaseStats(),
    };

    // Calculate requirements
    for (var lesson in LessonLibrary.allLessons) {
      if (lesson.isMandatory) {
        stats[lesson.phase]!.required += lesson.periods;
      }
    }

    // Calculate scheduled
    for (var session in sessions) {
      for (var phase in Phase.values) {
        final slots = session.matrix[phase] ?? [];
        for (var slot in slots) {
          if (slot.eoCode != null) {
            // Check if this code belongs to a mandatory lesson for THIS phase
            final isMandatory = LessonLibrary.allLessons.any((l) => 
              l.code == slot.eoCode && l.phase == phase && l.isMandatory
            );
            if (isMandatory) {
              stats[phase]!.scheduled++;
            }
          }
        }
      }
    }

    return stats;
  }

  Map<String, int> _getScheduledCountsForPhase(Phase phase) {
    final Map<String, int> counts = {};
    for (var session in sessions) {
      final slots = session.matrix[phase] ?? [];
      for (var slot in slots) {
        if (slot.eoCode != null) {
          counts[slot.eoCode!] = (counts[slot.eoCode!] ?? 0) + 1;
        }
      }
    }
    return counts;
  }
}

class _PhaseStats {
  int required = 0;
  int scheduled = 0;
  double get percentage => required == 0 ? 0 : (scheduled / required).clamp(0.0, 1.0);
}

class _PhaseProgressCard extends StatelessWidget {
  final Phase phase;
  final _PhaseStats stats;

  const _PhaseProgressCard({required this.phase, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.navy.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.gold.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: stats.percentage,
                  strokeWidth: 8,
                  backgroundColor: Colors.white.withOpacity(0.05),
                  color: _getColor(),
                ),
              ),
              Text(
                '${(stats.percentage * 100).toInt()}%',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            phase.label.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          const SizedBox(height: 4),
          Text(
            '${stats.scheduled} / ${stats.required} PER',
            style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }

  Color _getColor() {
    if (stats.percentage >= 1.0) return Colors.greenAccent;
    if (stats.percentage >= 0.5) return AppTheme.gold;
    return AppTheme.weekendColor;
  }
}

class _PhaseDetailSection extends StatelessWidget {
  final Phase phase;
  final List<Lesson> lessons;
  final Map<String, int> scheduledCounts;

  const _PhaseDetailSection({
    required this.phase,
    required this.lessons,
    required this.scheduledCounts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            phase.label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.gold),
          ),
        ),
        ...lessons.map((lesson) {
          final scheduled = scheduledCounts[lesson.code] ?? 0;
          final isComplete = scheduled >= lesson.periods;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  isComplete ? LucideIcons.checkCircle2 : LucideIcons.circle,
                  size: 16,
                  color: isComplete ? Colors.greenAccent : Colors.white24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${lesson.code}: ${lesson.title}',
                        style: TextStyle(
                          fontSize: 12,
                          color: isComplete ? Colors.white : Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: (scheduled / lesson.periods).clamp(0.0, 1.0),
                          minHeight: 2,
                          backgroundColor: Colors.white.withOpacity(0.05),
                          color: isComplete ? Colors.greenAccent : AppTheme.gold.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$scheduled/${lesson.periods}',
                  style: const TextStyle(fontSize: 10, fontFamily: 'monospace'),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }
}
