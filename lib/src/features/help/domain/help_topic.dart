import 'package:lucide_icons/lucide_icons.dart';

class HelpTopic {
  final String title;
  final String category;
  final String content;
  final List<WorkflowStep>? steps;

  const HelpTopic({
    required this.title,
    required this.category,
    required this.content,
    this.steps,
  });
}

class WorkflowStep {
  final String title;
  final String description;
  final dynamic icon;

  const WorkflowStep({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const List<HelpTopic> helpTopics = [
  HelpTopic(
    title: 'Initial Setup Roadmap',
    category: 'Getting Started',
    content: 'Follow these steps to get your training year configured perfectly from day one.',
    steps: [
      WorkflowStep(
        title: 'Populate Registries',
        description: 'Start by adding your Instructors and Training Locations. This enables the deconfliction engine to track availability.',
        icon: LucideIcons.users,
      ),
      WorkflowStep(
        title: 'Set Your Element',
        description: 'Choose between Sea, Army, or Air Cadets in the Dashboard. This updates all Lesson Library EOs to match your curriculum.',
        icon: LucideIcons.anchor,
      ),
      WorkflowStep(
        title: 'Configure Calendar',
        description: 'Switch between Academic Year (Sep-Jun) or Full Year (Jan-Dec) and set your primary parade night.',
        icon: LucideIcons.calendar,
      ),
      WorkflowStep(
        title: 'Start Planning',
        description: 'Navigate to the Calendar to add sessions, or use the Experimental Auto-Plan tool to distribute mandatory lessons.',
        icon: LucideIcons.wand2,
      ),
    ],
  ),
  HelpTopic(
    title: 'Scheduling Lessons',
    category: 'Calendar',
    content: 'To schedule a lesson, go to the Training Calendar, click on a session date, and then click an EMPTY slot in the matrix. You can then select a lesson from the library, assign an instructor, and set a location.',
  ),
  HelpTopic(
    title: 'Deconfliction',
    category: 'Planning',
    content: 'The tool automatically checks for instructor and location conflicts. If an instructor is already assigned to a period in another phase, they will be marked as (IN USE) in the dropdown. An alert icon will also appear in the matrix if a conflict exists.',
  ),
  HelpTopic(
    title: 'Switching Themes',
    category: 'Settings',
    content: 'You can switch between Light, Dark, Sea, and System themes using the icons in the Dashboard header. The Sea theme is a special high-contrast dark mode with Navy and Gold accents.',
  ),
  HelpTopic(
    title: 'Training Phases',
    category: 'General',
    content: 'The tool supports four training phases. Each phase has its own mandatory and complementary lessons. The progress for each phase is tracked independently.',
  ),
  HelpTopic(
    title: 'Smart Auto-Plan (Experimental)',
    category: 'Planning',
    content: 'NOTE: This feature is currently experimental. The Auto-Plan tool distributes remaining Mandatory Fundamental lessons across empty slots using a round-robin algorithm. We recommend reviewing the results carefully as the logic is still being refined.',
  ),
  HelpTopic(
    title: 'Calendar View Modes',
    category: 'Calendar',
    content: 'You can now switch between ACADEMIC (Sep-Jun) and FULL YEAR (Jan-Dec) modes using the toggle in the calendar header. This is useful for planning summer training or specialized courses outside the normal school year.',
  ),
  HelpTopic(
    title: 'Backup & Restore',
    category: 'Data',
    content: 'You can download a full backup of your training data from the Dashboard. On the web, this will trigger a direct download of a .json file. To restore, simply upload that same file using the "Import" tool.',
  ),
  HelpTopic(
    title: 'Resetting the Schedule',
    category: 'Calendar',
    content: 'If you want to start fresh or re-run the Auto-Plan, use the "Clear All Lessons" tool in the Auto-Plan menu. This wipes all planned periods while keeping your session dates and parade nights intact.',
  ),
];
