import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../features/calendar/domain/training_session.dart';
import '../../features/calendar/application/training_controller.dart';
import '../../theme/theme_controller.dart';
import 'glass_container.dart';

class ElementSelectorDialog extends ConsumerWidget {
  const ElementSelectorDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedElement = ref.watch(trainingProvider).selectedElement;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: GlassContainer(
        opacity: 0.1,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'SELECT ELEMENT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Customize your experience',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 32),
            _buildElementCard(
              context,
              ref,
              CadetElement.sea,
              'Sea Cadets',
              'Maritime focus & Seamanship',
              LucideIcons.anchor,
              const Color(0xFF00FFFF),
              selectedElement == CadetElement.sea,
            ),
            const SizedBox(height: 16),
            _buildElementCard(
              context,
              ref,
              CadetElement.army,
              'Army Cadets',
              'Land navigation & Expedition',
              LucideIcons.mountain,
              const Color(0xFF4B5320),
              selectedElement == CadetElement.army,
            ),
            const SizedBox(height: 16),
            _buildElementCard(
              context,
              ref,
              CadetElement.air,
              'Air Cadets',
              'Aviation & Aerospace',
              LucideIcons.plane,
              const Color(0xFF38BDF8),
              selectedElement == CadetElement.air,
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'CLOSE',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElementCard(
    BuildContext context,
    WidgetRef ref,
    CadetElement element,
    String title,
    String subtitle,
    IconData icon,
    Color accentColor,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        ref.read(trainingProvider.notifier).setElement(element);
        // Also update theme to match
        if (element == CadetElement.sea) {
          ref.read(themeControllerProvider.notifier).setTheme(AppThemeMode.sea);
        } else if (element == CadetElement.army) {
          ref.read(themeControllerProvider.notifier).setTheme(AppThemeMode.army);
        } else if (element == CadetElement.air) {
          ref.read(themeControllerProvider.notifier).setTheme(AppThemeMode.air);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected 
              ? accentColor.withValues(alpha: 0.2) 
              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected 
                ? accentColor 
                : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? accentColor : accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.black : accentColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? accentColor : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(LucideIcons.checkCircle2, color: accentColor),
          ],
        ),
      ),
    );
  }
}
