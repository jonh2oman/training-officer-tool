class HelpTopic {
  final String title;
  final String category;
  final String content;

  const HelpTopic({
    required this.title,
    required this.category,
    required this.content,
  });
}

const List<HelpTopic> helpTopics = [
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
