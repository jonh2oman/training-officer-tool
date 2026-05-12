import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';
import '../application/training_controller.dart';
import '../domain/training_session.dart';
import 'progress_dashboard_screen.dart';
import '../../../theme/app_theme.dart';

enum ViewType { list, calendar, board, dashboard }

class AcademicCalendarScreen extends ConsumerStatefulWidget {
  const AcademicCalendarScreen({super.key});

  @override
  ConsumerState<AcademicCalendarScreen> createState() => _AcademicCalendarScreenState();
}

class _AcademicCalendarScreenState extends ConsumerState<AcademicCalendarScreen> {
  ViewType _currentView = ViewType.list;

  @override
  Widget build(BuildContext context) {
    final trainingState = ref.watch(trainingProvider);
    
    // Group sessions by month
    final Map<String, List<TrainingSession>> groupedSessions = {};
    for (var session in trainingState.sessions) {
      final monthName = DateFormat('MMMM yyyy').format(session.date);
      groupedSessions.putIfAbsent(monthName, () => []).add(session);
    }

    if (trainingState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                DropdownButton<int>(
                  value: trainingState.academicYear,
                  dropdownColor: AppTheme.black,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  icon: const Icon(LucideIcons.chevronDown, size: 16, color: AppTheme.gold),
                  onChanged: (year) {
                    if (year != null) {
                      ref.read(trainingProvider.notifier).setAcademicYear(year);
                    }
                  },
                  items: [2024, 2025, 2026, 2027, 2028].map((year) {
                    return DropdownMenuItem(
                      value: year,
                      child: Text('ACADEMIC YEAR $year-${year + 1}'),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Text(
                      'CORPS PARADES ON: ',
                      style: TextStyle(fontSize: 8, color: AppTheme.gold.withOpacity(0.5), letterSpacing: 1),
                    ),
                    DropdownButton<int>(
                      value: trainingState.paradeWeekday,
                      dropdownColor: AppTheme.black,
                      underline: const SizedBox(),
                      isDense: true,
                      style: const TextStyle(color: AppTheme.gold, fontWeight: FontWeight.bold, fontSize: 10),
                      onChanged: (day) {
                        if (day != null) {
                          ref.read(trainingProvider.notifier).setParadeWeekday(day);
                        }
                      },
                      items: [
                        const DropdownMenuItem(value: 1, child: Text('MONDAY')),
                        const DropdownMenuItem(value: 2, child: Text('TUESDAY')),
                        const DropdownMenuItem(value: 3, child: Text('WEDNESDAY')),
                        const DropdownMenuItem(value: 4, child: Text('THURSDAY')),
                        const DropdownMenuItem(value: 5, child: Text('FRIDAY')),
                        const DropdownMenuItem(value: 6, child: Text('SATURDAY')),
                        const DropdownMenuItem(value: 7, child: Text('SUNDAY')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SegmentedButton<ViewType>(
              segments: const [
                ButtonSegment(value: ViewType.list, icon: Icon(LucideIcons.list), label: Text('LIST')),
                ButtonSegment(value: ViewType.calendar, icon: Icon(LucideIcons.calendar), label: Text('CAL')),
                ButtonSegment(value: ViewType.board, icon: Icon(LucideIcons.columns), label: Text('BOARD')),
                ButtonSegment(value: ViewType.dashboard, icon: Icon(LucideIcons.barChart3), label: Text('STATS')),
              ],
              selected: {_currentView},
              onSelectionChanged: (newView) => setState(() => _currentView = newView.first),
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                side: WidgetStateProperty.all(BorderSide(color: AppTheme.gold.withOpacity(0.2))),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.users),
            onPressed: () => context.push('/instructors'),
            tooltip: 'Instructor Registry',
          ),
          IconButton(
            icon: const Icon(LucideIcons.fileText),
            onPressed: () {}, // Future PDF
          ),
        ],
      ),
      body: _buildCurrentView(trainingState, groupedSessions),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime(trainingState.academicYear, 9, 1),
            firstDate: DateTime(trainingState.academicYear, 9, 1),
            lastDate: DateTime(trainingState.academicYear + 1, 6, 30),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: AppTheme.gold,
                    onPrimary: AppTheme.black,
                    surface: AppTheme.black,
                    onSurface: Colors.white,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked != null && mounted) {
            final type = await showDialog<SessionType>(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppTheme.black,
                title: const Text('SESSION TYPE', style: TextStyle(color: AppTheme.gold)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(LucideIcons.sun, color: AppTheme.dayColor),
                      title: const Text('TRAINING DAY'),
                      onTap: () => Navigator.pop(context, SessionType.trainingDay),
                    ),
                    ListTile(
                      leading: const Icon(LucideIcons.tent, color: AppTheme.weekendColor),
                      title: const Text('WEEKEND EXERCISE'),
                      onTap: () => Navigator.pop(context, SessionType.weekend),
                    ),
                  ],
                ),
              ),
            );

            if (type != null) {
              ref.read(trainingProvider.notifier).addAdHocSession(picked, type);
            }
          }
        },
        icon: const Icon(LucideIcons.plus),
        label: const Text('ADD TRAINING DAY'),
        backgroundColor: AppTheme.gold,
        foregroundColor: AppTheme.black,
      ),
    );
  }

  Widget _buildCurrentView(dynamic trainingState, Map<String, List<TrainingSession>> groupedSessions) {
    switch (_currentView) {
      case ViewType.list:
        return _buildListView(groupedSessions);
      case ViewType.calendar:
        return _buildCalendarView(trainingState.sessions);
      case ViewType.board:
        return _buildBoardView(groupedSessions);
      case ViewType.dashboard:
        return _buildDashboardView(trainingState.sessions);
    }
  }

  Widget _buildDashboardView(List<TrainingSession> sessions) {
    return ProgressDashboardScreen(sessions: sessions);
  }

  Widget _buildListView(Map<String, List<TrainingSession>> groupedSessions) {
    return ListView.builder(
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
    );
  }

  Widget _buildCalendarView(List<TrainingSession> sessions) {
    final Map<DateTime, TrainingSession> dateMap = {
      for (var s in sessions) DateTime(s.date.year, s.date.month, s.date.day): s
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          for (int m = 9; m <= 18; m++) ...[
            _buildMonthGrid(m > 12 ? m - 12 : m, m > 12 ? 2027 : 2026, dateMap),
            const SizedBox(height: 48),
          ],
        ],
      ),
    );
  }

  Widget _buildMonthGrid(int month, int year, Map<DateTime, TrainingSession> dateMap) {
    final firstDay = DateTime(year, month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(year, month);
    final offset = firstDay.weekday % 7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMMM yyyy').format(firstDay).toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: AppTheme.gold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: daysInMonth + offset,
          itemBuilder: (context, index) {
            if (index < offset) return const SizedBox();
            final day = index - offset + 1;
            final date = DateTime(year, month, day);
            final session = dateMap[date];

            return InkWell(
              onTap: session != null ? () => context.push('/planning/${session.id}') : null,
              child: Container(
                decoration: BoxDecoration(
                  color: session != null ? AppTheme.navy : Colors.white.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: session != null ? AppTheme.gold.withOpacity(0.5) : Colors.white.withOpacity(0.05),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$day', style: TextStyle(fontSize: 10, color: session != null ? Colors.white : Colors.white24)),
                    if (session != null)
                      const Icon(LucideIcons.anchor, size: 10, color: AppTheme.gold),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBoardView(Map<String, List<TrainingSession>> groupedSessions) {
    final scrollController = ScrollController();
    
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(24),
          children: groupedSessions.entries.map((entry) {
            return Container(
              width: 320,
              margin: const EdgeInsets.only(right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.gold.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      entry.key.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: AppTheme.gold, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView(
                      children: entry.value.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _SessionCard(session: s),
                      )).toList(),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
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
        onTap: () => context.push('/planning/${session.id}'),
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
