import 'package:gemini_hackathon/app/pages/diet/diet_page.dart';
import 'package:gemini_hackathon/app/pages/main/main_page.dart';
import 'package:gemini_hackathon/app/routes/app_route_constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouteConstants.main,
        name: AppRouteConstants.main,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const MainPage(),
        ),
      ),
      GoRoute(
        path: AppRouteConstants.diet,
        name: AppRouteConstants.diet,
        pageBuilder: (context, state) {
          final timestamp = state.pathParameters['timestamp'] ?? '';

          if (timestamp.isEmpty) {
            return const NoTransitionPage(
              child: MainPage(),
            );
          }

          return NoTransitionPage(
            key: state.pageKey,
            child: DietPage(timestamp: timestamp),
          );
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
