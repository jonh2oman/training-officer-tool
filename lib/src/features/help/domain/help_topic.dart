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
    title: 'Exporting PDF',
    category: 'Reporting',
    content: 'In the Planning Matrix screen, click the download icon in the top right to generate a Routine Order PDF for that training session.',
  ),
];
