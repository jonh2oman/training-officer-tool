import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/calendar/presentation/academic_calendar_screen.dart';
import '../features/instructors/presentation/instructor_registry_screen.dart';
import '../features/locations/presentation/location_registry_screen.dart';
import '../features/help/presentation/help_screen.dart';
import '../features/dashboard/presentation/changelog_screen.dart';

import '../features/calendar/presentation/planning_matrix_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/calendar',
        builder: (context, state) => const AcademicCalendarScreen(),
      ),
      GoRoute(
        path: '/planning/:sessionId',
        builder: (context, state) => PlanningMatrixScreen(
          sessionId: state.pathParameters['sessionId']!,
        ),
      ),
      GoRoute(
        path: '/instructors',
        builder: (context, state) => const InstructorRegistryScreen(),
      ),
      GoRoute(
        path: '/locations',
        builder: (context, state) => const LocationRegistryScreen(),
      ),
      GoRoute(
        path: '/help',
        builder: (context, state) => const HelpScreen(),
      ),
      GoRoute(
        path: '/changelog',
        builder: (context, state) => const ChangelogScreen(),
      ),
    ],
  );
});
