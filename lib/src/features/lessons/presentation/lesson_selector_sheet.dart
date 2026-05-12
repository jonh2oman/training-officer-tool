import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../domain/lesson.dart';
import '../../calendar/domain/training_session.dart';
import '../../../theme/app_theme.dart';

class LessonSelectorSheet extends StatefulWidget {
  final Phase phase;
  final Function(Lesson lesson, String instructor, String location) onSelected;

  const LessonSelectorSheet({
    super.key,
    required this.phase,
    required this.onSelected,
  });

  @override
  State<LessonSelectorSheet> createState() => _LessonSelectorSheetState();
}

class _LessonSelectorSheetState extends State<LessonSelectorSheet> {
  String _searchQuery = '';
  String _selectedCategory = 'Fundamental';

  @override
  Widget build(BuildContext context) {
    final allLessons = LessonLibrary.getLessonsForPhase(widget.phase);
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
                return _LessonTile(
                  lesson: lesson,
                  onTap: () {
                    widget.onSelected(lesson, _instructor, _location);
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
                child: _buildSmallField('Instructor', LucideIcons.user, (val) => _instructor = val),
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

  String _instructor = '';
  String _location = '';

  Widget _buildSmallField(String hint, IconData icon, Function(String) onChanged) {
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
  final VoidCallback onTap;

  const _LessonTile({required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        title: Row(
          children: [
            Text(
              lesson.code,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.gold,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(width: 8),
            if (lesson.isMandatory)
              const Icon(LucideIcons.star, size: 14, color: AppTheme.gold),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            lesson.title,
            style: const TextStyle(color: Colors.white70, height: 1.3),
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
}
