import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../application/instructor_controller.dart';
import '../domain/instructor.dart';
import '../../lessons/domain/lesson.dart';
import '../../calendar/domain/training_session.dart';
import '../../calendar/application/training_controller.dart';
import '../../../theme/app_theme.dart';
import '../../../shared/widgets/glass_container.dart';

class InstructorRegistryScreen extends ConsumerWidget {
  const InstructorRegistryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instructors = ref.watch(instructorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('INSTRUCTOR REGISTRY', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: instructors.isEmpty
          ? _buildEmptyState(context, ref)
          : ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: instructors.length,
              itemBuilder: (context, index) {
                final instructor = instructors[index];
                return _InstructorCard(instructor: instructor);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showInstructorDialog(context, ref),
        icon: const Icon(LucideIcons.plus),
        label: const Text('ADD INSTRUCTOR'),
        backgroundColor: AppTheme.gold,
        foregroundColor: AppTheme.black,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.users, size: 64, color: AppTheme.gold.withValues(alpha: 0.2)),
          const SizedBox(height: 16),
          Text(
            'NO INSTRUCTORS REGISTRY',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5), letterSpacing: 1),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => _showInstructorDialog(context, ref),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.gold, foregroundColor: AppTheme.black),
            child: const Text('ADD YOUR FIRST STAFF MEMBER'),
          ),
        ],
      ),
    );
  }

  void _showInstructorDialog(BuildContext context, WidgetRef ref, [Instructor? instructor]) {
    final nameController = TextEditingController(text: instructor?.name);
    final rankController = TextEditingController(text: instructor?.rank);
    bool isStaff = instructor?.isStaff ?? false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            instructor == null ? 'ADD INSTRUCTOR' : 'EDIT INSTRUCTOR', 
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: rankController,
                decoration: const InputDecoration(labelText: 'RANK (e.g. Lt(N), CPO1)'),
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'NAME'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('OFFICER / ADULT STAFF'),
                value: isStaff,
                onChanged: (val) => setState(() => isStaff = val),
                activeColor: AppTheme.gold,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('CANCEL', style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5))),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && rankController.text.isNotEmpty) {
                  final newInstructor = Instructor(
                    id: instructor?.id,
                    name: nameController.text,
                    rank: rankController.text,
                    isStaff: isStaff,
                  );
                  if (instructor == null) {
                    ref.read(instructorProvider.notifier).addInstructor(newInstructor);
                  } else {
                    ref.read(instructorProvider.notifier).updateInstructor(newInstructor);
                  }
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.gold, foregroundColor: AppTheme.black),
              child: const Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showInstructorQualifications(BuildContext context, WidgetRef ref, Instructor instructor) {
  final selectedElement = ref.read(trainingProvider).selectedElement;
  
  showDialog(
    context: context,
    builder: (context) => Consumer(
      builder: (context, ref, _) {
        // Re-fetch current instructor from provider to get updated qualifications
        final currentInstructor = ref.watch(instructorProvider).firstWhere((i) => i.id == instructor.id);
        
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text('QUALIFICATIONS: ${currentInstructor.name.toUpperCase()}'),
          content: SizedBox(
            width: 500,
            child: DefaultTabController(
              length: Phase.values.length,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                    isScrollable: true,
                    labelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    indicatorColor: AppTheme.gold,
                    labelColor: AppTheme.gold,
                    unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    tabs: Phase.values.map((p) => Tab(text: p.getLabel(selectedElement).toUpperCase())).toList(),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 400,
                    child: TabBarView(
                      children: Phase.values.map((p) {
                        final lessons = LessonLibrary.getLessonsForPhase(p, element: selectedElement);
                        return ListView.builder(
                          itemCount: lessons.length,
                          itemBuilder: (context, i) {
                            final lesson = lessons[i];
                            final isQualified = currentInstructor.isQualified(lesson.code);
                            return CheckboxListTile(
                              title: Text(lesson.code, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              subtitle: Text(lesson.title, style: const TextStyle(fontSize: 10)),
                              value: isQualified,
                              activeColor: AppTheme.gold,
                              checkColor: AppTheme.black,
                              onChanged: (_) {
                                ref.read(instructorProvider.notifier).toggleQualification(currentInstructor.id, lesson.code);
                              },
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('CLOSE')),
          ],
        );
      },
    ),
  );
}

class _InstructorCard extends ConsumerWidget {
  final Instructor instructor;
  const _InstructorCard({required this.instructor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassContainer(
      opacity: 0.05,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: instructor.isStaff 
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) 
            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
          child: Icon(
            instructor.isStaff ? LucideIcons.shieldCheck : LucideIcons.user,
            color: instructor.isStaff 
              ? Theme.of(context).colorScheme.primary 
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
            size: 20,
          ),
        ),
        title: Text(instructor.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          instructor.isStaff ? 'Adult Staff' : 'Senior Cadet', 
          style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(LucideIcons.award, size: 16, color: AppTheme.gold),
              onPressed: () => _showInstructorQualifications(context, ref, instructor),
              tooltip: 'Qualifications',
            ),
            IconButton(
              icon: const Icon(LucideIcons.edit2, size: 16),
              onPressed: () => const InstructorRegistryScreen()._showInstructorDialog(context, ref, instructor),
            ),
            IconButton(
              icon: const Icon(LucideIcons.trash2, size: 16, color: AppTheme.weekendColor),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('DELETE INSTRUCTOR?'),
                    content: Text('Are you sure you want to remove ${instructor.displayName} from the registry?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
                      TextButton(
                        onPressed: () {
                          ref.read(instructorProvider.notifier).deleteInstructor(instructor.id);
                          Navigator.pop(context);
                        },
                        child: const Text('DELETE', style: TextStyle(color: AppTheme.weekendColor)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
