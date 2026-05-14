import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../application/location_controller.dart';
import '../domain/location.dart';
import '../../../theme/app_theme.dart';
import '../../../shared/widgets/glass_container.dart';

class LocationRegistryScreen extends ConsumerWidget {
  const LocationRegistryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOCATION REGISTRY', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: locations.isEmpty
          ? _buildEmptyState(context, ref)
          : ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return _LocationCard(location: location);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showLocationDialog(context, ref),
        icon: const Icon(LucideIcons.plus),
        label: const Text('ADD SPACE'),
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
          Icon(LucideIcons.mapPin, size: 64, color: AppTheme.gold.withValues(alpha: 0.2)),
          const SizedBox(height: 16),
          Text(
            'NO TRAINING SPACES DEFINED',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5), letterSpacing: 1),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => _showLocationDialog(context, ref),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.gold, foregroundColor: AppTheme.black),
            child: const Text('ADD YOUR FIRST CLASSROOM'),
          ),
        ],
      ),
    );
  }

  void _showLocationDialog(BuildContext context, WidgetRef ref, [TrainingLocation? location]) {
    final nameController = TextEditingController(text: location?.name);
    final descController = TextEditingController(text: location?.description);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          location == null ? 'ADD SPACE' : 'EDIT SPACE', 
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'NAME (e.g. Classroom 1, Parade Square)'),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'DESCRIPTION (Optional)'),
              textCapitalization: TextCapitalization.sentences,
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
              if (nameController.text.isNotEmpty) {
                final newLocation = TrainingLocation(
                  id: location?.id,
                  name: nameController.text,
                  description: descController.text,
                );
                if (location == null) {
                  ref.read(locationProvider.notifier).addLocation(newLocation);
                } else {
                  ref.read(locationProvider.notifier).updateLocation(newLocation);
                }
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.gold, foregroundColor: AppTheme.black),
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }
}

class _LocationCard extends ConsumerWidget {
  final TrainingLocation location;
  const _LocationCard({required this.location});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassContainer(
      opacity: 0.05,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
          child: Icon(LucideIcons.mapPin, color: Theme.of(context).colorScheme.primary, size: 20),
        ),
        title: Text(location.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: location.description != null && location.description!.isNotEmpty
            ? Text(location.description!, style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)))
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(LucideIcons.edit2, size: 16),
              onPressed: () => const LocationRegistryScreen()._showLocationDialog(context, ref, location),
            ),
            IconButton(
              icon: const Icon(LucideIcons.trash2, size: 16, color: AppTheme.weekendColor),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('DELETE SPACE?'),
                    content: Text('Are you sure you want to remove ${location.name} from the registry?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
                      TextButton(
                        onPressed: () {
                          ref.read(locationProvider.notifier).deleteLocation(location.id);
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
