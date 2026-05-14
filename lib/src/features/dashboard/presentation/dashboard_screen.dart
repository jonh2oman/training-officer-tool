import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/theme_controller.dart';
import '../../../shared/widgets/glass_container.dart';

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
