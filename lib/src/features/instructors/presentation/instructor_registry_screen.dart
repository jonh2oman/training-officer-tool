import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../application/instructor_controller.dart';
import '../domain/instructor.dart';
import '../../../theme/app_theme.dart';

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
          Icon(LucideIcons.users, size: 64, color: AppTheme.gold.withOpacity(0.2)),
          const SizedBox(height: 16),
          Text(
            'NO INSTRUCTORS REGISTRY',
            style: TextStyle(color: Colors.white.withOpacity(0.5), letterSpacing: 1),
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
          backgroundColor: AppTheme.black,
          title: Text(instructor == null ? 'ADD INSTRUCTOR' : 'EDIT INSTRUCTOR', style: const TextStyle(color: AppTheme.gold)),
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
              child: const Text('CANCEL', style: TextStyle(color: Colors.white54)),
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

class _InstructorCard extends ConsumerWidget {
  final Instructor instructor;
  const _InstructorCard({required this.instructor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: instructor.isStaff ? AppTheme.gold.withOpacity(0.1) : Colors.white.withOpacity(0.05),
          child: Icon(
            instructor.isStaff ? LucideIcons.shieldCheck : LucideIcons.user,
            color: instructor.isStaff ? AppTheme.gold : Colors.white38,
            size: 20,
          ),
        ),
        title: Text(instructor.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(instructor.isStaff ? 'Adult Staff' : 'Senior Cadet', style: const TextStyle(fontSize: 10, color: Colors.white38)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
