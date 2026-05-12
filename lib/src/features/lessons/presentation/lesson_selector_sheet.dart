import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../domain/lesson.dart';
import '../../calendar/domain/training_session.dart';
import '../../instructors/domain/instructor.dart';
import '../../instructors/application/instructor_controller.dart';
import '../../locations/domain/location.dart';
import '../../locations/application/location_controller.dart';
import '../../../theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../calendar/application/training_controller.dart';
import 'package:intl/intl.dart';

class LessonSelectorSheet extends ConsumerStatefulWidget {
  final Phase phase;
  final Function(Lesson lesson, String instructor, String? instructorId, String location, String? locationId) onSelected;

  const LessonSelectorSheet({
    super.key,
    required this.phase,
    required this.onSelected,
  });

  @override
  ConsumerState<LessonSelectorSheet> createState() => _LessonSelectorSheetState();
}

class _LessonSelectorSheetState extends ConsumerState<LessonSelectorSheet> {
  String _searchQuery = '';
  String _selectedCategory = 'Fundamental';

  @override
  Widget build(BuildContext context) {
    final trainingState = ref.watch(trainingProvider);
    final allLessons = LessonLibrary.getLessonsForPhase(widget.phase);
    
    // Map of EO code -> List of Dates where it is planned
    final Map<String, List<DateTime>> plannedMap = {};
    for (var session in trainingState.sessions) {
      for (var phase in session.matrix.values) {
        for (var slot in phase) {
          if (slot.eoCode != null) {
            plannedMap.putIfAbsent(slot.eoCode!, () => []).add(session.date);
          }
        }
      }
    }

    final filteredLessons = allLessons.where((l) {
      final matchesSearch = l.code.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          l.title.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = l.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          _buildHandle(),
          _buildHeader(),
          _buildCategoryTabs(),
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: filteredLessons.length,
              itemBuilder: (context, index) {
                final lesson = filteredLessons[index];
                final plannedDates = plannedMap[lesson.code] ?? [];
                
                return _LessonTile(
                  lesson: lesson,
                  plannedDates: plannedDates,
                  onTap: () {
                    widget.onSelected(lesson, _instructorName, _selectedInstructorId, _locationName, _selectedLocationId);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SELECT LESSON',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.gold.withOpacity(0.7),
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  widget.phase.label.toUpperCase(),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(LucideIcons.x),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    final categories = ['Fundamental', 'Elemental', 'Optional'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: categories.map((cat) {
          final isSelected = _selectedCategory == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(cat.toUpperCase(), style: const TextStyle(fontSize: 10)),
              selected: isSelected,
              onSelected: (val) => setState(() => _selectedCategory = cat),
              selectedColor: AppTheme.gold.withOpacity(0.2),
              labelStyle: TextStyle(
                color: isSelected ? AppTheme.gold : Colors.white38,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            onChanged: (val) => setState(() => _searchQuery = val),
            decoration: InputDecoration(
              hintText: 'Search EO code or title...',
              prefixIcon: const Icon(LucideIcons.search, size: 20),
              filled: true,
              fillColor: Colors.white.withOpacity(0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSmallField('Instructor', LucideIcons.user, (val) => _instructorName = val),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSmallField('Location', LucideIcons.mapPin, (val) => _location = val),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _instructorName = '';
  String? _selectedInstructorId;
  String _locationName = '';
  String? _selectedLocationId;

  Widget _buildSmallField(String hint, IconData icon, Function(String) onChanged) {
    if (hint == 'Instructor') {
      final instructors = ref.watch(instructorProvider);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Icon(icon, size: 14, color: Colors.white38),
                const SizedBox(width: 8),
                Text(hint, style: const TextStyle(fontSize: 12, color: Colors.white38)),
              ],
            ),
            value: _selectedInstructorId,
            dropdownColor: AppTheme.black,
            items: instructors.map((i) => DropdownMenuItem(
              value: i.id,
              child: Text(i.displayName, style: const TextStyle(fontSize: 12)),
            )).toList(),
            onChanged: (val) {
              if (val != null) {
                final instructor = instructors.firstWhere((i) => i.id == val);
                setState(() {
                  _selectedInstructorId = val;
                  _instructorName = instructor.displayName;
                });
              }
            },
          ),
        ),
      );
    }
    
    if (hint == 'Location') {
      final locations = ref.watch(locationProvider);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Icon(icon, size: 14, color: Colors.white38),
                const SizedBox(width: 8),
                Text(hint, style: const TextStyle(fontSize: 12, color: Colors.white38)),
              ],
            ),
            value: _selectedLocationId,
            dropdownColor: AppTheme.black,
            items: locations.map((l) => DropdownMenuItem(
              value: l.id,
              child: Text(l.name, style: const TextStyle(fontSize: 12)),
            )).toList(),
            onChanged: (val) {
              if (val != null) {
                final location = locations.firstWhere((l) => l.id == val);
                setState(() {
                  _selectedLocationId = val;
                  _locationName = location.name;
                });
              }
            },
          ),
        ),
      );
    }

    return TextField(
      onChanged: onChanged,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, size: 14),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  final Lesson lesson;
  final List<DateTime> plannedDates;
  final VoidCallback onTap;

  const _LessonTile({
    required this.lesson,
    required this.plannedDates,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMaxed = plannedDates.length >= lesson.periods;
    final bool hasConflict = lesson.periods == 1 && plannedDates.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isMaxed ? Colors.white.withOpacity(0.01) : Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isMaxed ? Colors.red.withOpacity(0.1) : Colors.white.withOpacity(0.05),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        title: Row(
          children: [
            Text(
              lesson.code,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isMaxed ? Colors.white24 : AppTheme.gold,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(width: 8),
            if (lesson.isMandatory)
              Icon(LucideIcons.star, size: 14, color: isMaxed ? Colors.white10 : AppTheme.gold),
            const Spacer(),
            if (hasConflict)
              _buildWarningTag('ALREADY PLANNED (${DateFormat('MMM d').format(plannedDates.first)})')
            else if (plannedDates.isNotEmpty)
              _buildProgressTag('PLANNED ${plannedDates.length}/${lesson.periods}P'),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            lesson.title,
            style: TextStyle(
              color: isMaxed ? Colors.white10 : Colors.white70,
              height: 1.3,
            ),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${lesson.periods}P',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildWarningTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.redAccent, fontSize: 8, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProgressTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.blueAccent, fontSize: 8, fontWeight: FontWeight.bold),
      ),
    );
  }
}
