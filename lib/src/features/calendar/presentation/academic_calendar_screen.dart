import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../application/training_controller.dart';
import '../domain/training_session.dart';
import '../../../theme/app_theme.dart';

class AcademicCalendarScreen extends ConsumerWidget {
  const AcademicCalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingState = ref.watch(trainingProvider);
    
    // Group sessions by month
    final Map<String, List<TrainingSession>> groupedSessions = {};
    for (var session in trainingState.sessions) {
      final monthName = DateFormat('MMMM yyyy').format(session.date);
      groupedSessions.putIfAbsent(monthName, () => []).add(session);
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'ACADEMIC YEAR 2026-2027',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'SEA CADET CORPS PLANNING',
              style: TextStyle(
                fontSize: 10,
                color: AppTheme.gold.withOpacity(0.7),
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.fileText),
            onPressed: () {}, // Future PDF
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: groupedSessions.keys.length,
        itemBuilder: (context, index) {
          final month = groupedSessions.keys.elementAt(index);
          final sessions = groupedSessions[month]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  month.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.gold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              ...sessions.map((session) => _SessionCard(session: session)),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {}, // Add special day (Day Mode / Weekend)
        icon: const Icon(LucideIcons.plus),
        label: const Text('ADD TRAINING DAY'),
        backgroundColor: AppTheme.gold,
        foregroundColor: AppTheme.black,
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final TrainingSession session;
  const _SessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final dayName = DateFormat('EEEE').format(session.date);
    final dayNum = DateFormat('dd').format(session.date);
    
    Color typeColor;
    IconData typeIcon;
    switch (session.type) {
      case SessionType.paradeNight:
        typeColor = AppTheme.paradeColor;
        typeIcon = LucideIcons.calendar;
        break;
      case SessionType.trainingDay:
        typeColor = AppTheme.dayColor;
        typeIcon = LucideIcons.sun;
        break;
      case SessionType.weekend:
        typeColor = AppTheme.weekendColor;
        typeIcon = LucideIcons.tent;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => context.go('/planning/${session.id}'),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 60,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      dayNum,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dayName.substring(0, 3).toUpperCase(),
                      style: const TextStyle(fontSize: 10, color: Colors.white38),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getTypeLabel(session.type).toUpperCase(),
                      style: TextStyle(
                        color: typeColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Training Night - Planning Pending',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Icon(typeIcon, color: typeColor.withOpacity(0.5), size: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _getTypeLabel(SessionType type) {
    switch (type) {
      case SessionType.paradeNight: return 'Parade Night';
      case SessionType.trainingDay: return 'Training Day';
      case SessionType.weekend: return 'Weekend';
    }
  }
}
