import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/theme_controller.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../shared/widgets/element_selector_dialog.dart';
import '../application/backup_service.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background Decoration
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildThemeSwitcher(context, ref, themeMode),
                      IconButton(
                        icon: Icon(LucideIcons.helpCircle, color: Theme.of(context).colorScheme.primary),
                        onPressed: () => context.push('/help'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildHeader(context),
                  const SizedBox(height: 48),
                  Text(
                    'MAIN MENU',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        _DashboardCard(
                          title: 'Training Calendar',
                          subtitle: 'View and manage the academic training matrix',
                          icon: LucideIcons.calendarDays,
                          color: AppTheme.paradeColor,
                          onTap: () => context.push('/calendar'),
                        ),
                        const SizedBox(height: 16),
                        _DashboardCard(
                          title: 'Instructor Registry',
                          subtitle: 'Manage personnel and qualifications',
                          icon: LucideIcons.users,
                          color: AppTheme.dayColor,
                          onTap: () => context.push('/instructors'),
                        ),
                        const SizedBox(height: 16),
                        _DashboardCard(
                          title: 'Location Registry',
                          subtitle: 'Manage facilities and spaces',
                          icon: LucideIcons.mapPin,
                          color: AppTheme.weekendColor,
                          onTap: () => context.push('/locations'),
                        ),
                        const SizedBox(height: 16),
                        _DashboardCard(
                          title: 'Element Settings',
                          subtitle: 'Sea, Army, or Air configuration',
                          icon: LucideIcons.shield,
                          color: Colors.blueGrey,
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => const ElementSelectorDialog(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _DashboardCard(
                          title: 'Backup & Sync',
                          subtitle: 'Export or import your planning data',
                          icon: LucideIcons.database,
                          color: Colors.amber,
                          onTap: () => _showBackupOptions(context),
                        ),
                      ],
                    ),
                  ),
                  _buildFooter(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSwitcher(BuildContext context, WidgetRef ref, AppThemeMode currentMode) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GlassContainer(
      padding: const EdgeInsets.all(4),
      opacity: isDark ? 0.05 : 0.08,
      color: isDark ? Colors.white : Colors.black,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _themeIcon(context, ref, AppThemeMode.light, LucideIcons.sun, currentMode),
          _themeIcon(context, ref, AppThemeMode.dark, LucideIcons.moon, currentMode),
          _themeIcon(context, ref, AppThemeMode.sea, LucideIcons.waves, currentMode),
          _themeIcon(context, ref, AppThemeMode.army, LucideIcons.mountain, currentMode),
          _themeIcon(context, ref, AppThemeMode.air, LucideIcons.plane, currentMode),
          _themeIcon(context, ref, AppThemeMode.system, LucideIcons.monitor, currentMode),
        ],
      ),
    );
  }

  Widget _themeIcon(BuildContext context, WidgetRef ref, AppThemeMode mode, IconData icon, AppThemeMode currentMode) {
    final isSelected = mode == currentMode;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: () => ref.read(themeControllerProvider.notifier).setTheme(mode),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isSelected 
            ? (isDark ? Colors.black : Colors.white) 
            : Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WELCOME TO THE',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Training Officer Tool',
          style: textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'v1.0.1',
            style: TextStyle(color: Colors.black12, fontSize: 12, fontFamily: 'monospace'),
          ),
          const SizedBox(width: 12),
          Container(width: 1, height: 12, color: Colors.black12),
          const SizedBox(width: 12),
          TextButton(
            onPressed: () => context.push('/changelog'),
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'CHANGE LOG',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                fontSize: 10,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBackupOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassContainer(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'DATA BACKUP & SYNC',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(LucideIcons.uploadCloud, color: Colors.blue),
                title: const Text('Export Backup'),
                subtitle: const Text('Save your current data to a file'),
                onTap: () async {
                  Navigator.pop(context);
                  await BackupService.exportBackup();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Backup exported successfully')),
                    );
                  }
                },
              ),
              const Divider(height: 32),
              ListTile(
                leading: const Icon(LucideIcons.downloadCloud, color: Colors.orange),
                title: const Text('Import Backup'),
                subtitle: const Text('Restore data from a file (Overwrites current data)'),
                onTap: () async {
                  Navigator.pop(context);
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Overwrite Local Data?'),
                      content: const Text(
                        'This will replace all your current sessions, instructors, and locations with the data from the backup file. This cannot be undone.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('CANCEL'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('OVERWRITE'),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    final success = await BackupService.importBackup();
                    if (context.mounted) {
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Backup imported! Please restart the app.')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Import failed or cancelled')),
                        );
                      }
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.03,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                LucideIcons.chevronRight,
                color: Colors.white.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
