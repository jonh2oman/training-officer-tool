import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../application/training_controller.dart';
import '../domain/training_session.dart';
import '../../../theme/app_theme.dart';
import '../../lessons/presentation/lesson_selector_sheet.dart';
import '../application/pdf_service.dart';

class PlanningMatrixScreen extends ConsumerWidget {
  final String sessionId;

  const PlanningMatrixScreen({super.key, required this.sessionId});

  void _showLessonSelector(BuildContext context, WidgetRef ref, Phase phase, int periodIndex) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LessonSelectorSheet(
        phase: phase,
        periodIndex: periodIndex,
        sessionId: sessionId,
        onSelected: (lesson, instructor, instructorId, location, locationId) {
          ref.read(trainingProvider.notifier).assignLesson(
                sessionId,
                phase,
                periodIndex,
                LessonSlot(
                  eoCode: lesson.code,
                  title: lesson.title,
                  instructor: instructor.isEmpty ? null : instructor,
                  instructorId: instructorId,
                  location: location.isEmpty ? null : location,
                  locationId: locationId,
                ),
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingState = ref.watch(trainingProvider);
    final session = trainingState.sessions.firstWhere((s) => s.id == sessionId);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(LucideIcons.chevronLeft, color: Theme.of(context).colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text(
              DateFormat('EEEE, MMM d, yyyy').format(session.date).toUpperCase(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              _getTypeLabel(session.type).toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(LucideIcons.download, color: Theme.of(context).colorScheme.primary),
            onPressed: () => PdfService.generateRoutineOrder(session),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildPhaseHeader(context),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: session.numPeriods,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildPeriodRow(context, ref, 'PERIOD ${index + 1}', session, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
      child: Row(
        children: [
          const SizedBox(width: 80), // Label space
          for (var phase in Phase.values)
            Expanded(
              child: Text(
                phase.label.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPeriodRow(BuildContext context, WidgetRef ref, String label, TrainingSession session, int periodIndex) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 120,
          alignment: Alignment.center,
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12, 
                fontWeight: FontWeight.w900, 
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1), 
                letterSpacing: 4
              ),
            ),
          ),
        ),
        for (var phase in Phase.values)
          Expanded(
            child: _LessonSlotCard(
              slot: session.matrix[phase]![periodIndex],
              instructorConflict: _checkForInstructorConflict(session, periodIndex, phase),
              locationConflict: _checkForLocationConflict(session, periodIndex, phase),
              onTap: () => _showLessonSelector(context, ref, phase, periodIndex),
            ),
          ),
      ],
    );
  }

  bool _checkForInstructorConflict(TrainingSession session, int periodIndex, Phase currentPhase) {
    final currentInstructorId = session.matrix[currentPhase]![periodIndex].instructorId;
    if (currentInstructorId == null) return false;

    for (var phase in Phase.values) {
      if (phase == currentPhase) continue;
      if (session.matrix[phase]![periodIndex].instructorId == currentInstructorId) {
        return true;
      }
    }
    return false;
  }

  bool _checkForLocationConflict(TrainingSession session, int periodIndex, Phase currentPhase) {
    final currentLocationId = session.matrix[currentPhase]![periodIndex].locationId;
    if (currentLocationId == null) return false;

    for (var phase in Phase.values) {
      if (phase == currentPhase) continue;
      if (session.matrix[phase]![periodIndex].locationId == currentLocationId) {
        return true;
      }
    }
    return false;
  }

  String _getTypeLabel(SessionType type) {
    switch (type) {
      case SessionType.paradeNight: return 'Parade Night';
      case SessionType.trainingDay: return 'Training Day';
      case SessionType.weekend: return 'Weekend';
    }
  }
}

class _LessonSlotCard extends StatelessWidget {
  final LessonSlot slot;
  final bool instructorConflict;
  final bool locationConflict;
  final VoidCallback onTap;

  const _LessonSlotCard({
    required this.slot,
    this.instructorConflict = false,
    this.locationConflict = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: slot.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.plus, size: 16, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
                    const SizedBox(height: 4),
                    Text(
                      'EMPTY', 
                      style: TextStyle(
                        fontSize: 8, 
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1), 
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          slot.eoCode ?? '',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                        ),
                        if (instructorConflict || locationConflict)
                          Tooltip(
                            message: instructorConflict 
                                ? 'Instructor Conflict!' 
                                : 'Location Conflict!',
                            child: Icon(
                              LucideIcons.alertTriangle, 
                              size: 12, 
                              color: instructorConflict ? Colors.redAccent : Colors.orangeAccent
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      slot.title ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11, height: 1.2),
                    ),
                    const Spacer(),
                    if (slot.instructor != null || slot.location != null)
                      Row(
                        children: [
                          if (slot.instructor != null)
                            Expanded(
                              child: Text(
                                slot.instructor!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 8, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3)),
                              ),
                            ),
                          if (slot.location != null)
                            Text(
                              '@ ${slot.location!}',
                              style: TextStyle(fontSize: 8, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                            ),
                        ],
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
