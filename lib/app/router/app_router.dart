import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/nexis/presentation/pages/nexis_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../shared/layouts/main_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/nexis',
              builder: (context, state) => const NexisPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/projects',
              builder: (context, state) => const ProjectsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
