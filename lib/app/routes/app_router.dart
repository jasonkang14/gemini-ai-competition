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
    ],
  );

  static GoRouter get router => _router;
}
