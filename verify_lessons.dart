import 'lib/src/features/lessons/domain/lesson.dart';
import 'lib/src/features/calendar/domain/training_session.dart';

void main() {
  final airLessons = LessonLibrary.getLessonsForPhase(Phase.level1, element: CadetElement.air);
  print('--- AIR LEVEL 1 LESSONS ---');
  for (final l in airLessons) {
    if (l.code.contains('107')) {
      print('${l.code}: ${l.title}');
    }
  }
  
  final seaLessons = LessonLibrary.getLessonsForPhase(Phase.level1, element: CadetElement.sea);
  print('\n--- SEA LEVEL 1 LESSONS ---');
  for (final l in seaLessons) {
    if (l.code.contains('107')) {
      print('${l.code}: ${l.title}');
    }
  }
}
