import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/calendar/presentation/academic_calendar_screen.dart';

import '../features/calendar/presentation/planning_matrix_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AcademicCalendarScreen(),
        routes: [
          GoRoute(
            path: 'planning/:sessionId',
            builder: (context, state) => PlanningMatrixScreen(
              sessionId: state.pathParameters['sessionId']!,
            ),
          ),
        ],
      ),
    ],
  );
});
