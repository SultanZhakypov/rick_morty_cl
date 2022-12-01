import 'package:auto_route/auto_route.dart';
import 'package:rick_morty/feature/home/presentation/pages/main_screen/main_screen.dart';
import 'package:rick_morty/feature/home/presentation/widgets/custom_search.dart';
import 'package:rick_morty/feature/settings/presentation/pages/settings_screen/settings_screen.dart';
import '../feature/detail/presentation/pages/detail_screen/detail_screen.dart';

export 'app_routes.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: DetailScreen,
      path: '/detail',
    ),
    AutoRoute(
      page: CustomSearchScreen,
      path: '/search',
    ),
    AutoRoute(
      page: SettingsScreen,
      path: '/settings',
    ),
    AutoRoute(
      initial: true,
      page: MainScreen,
      path: '/',
    ),
  ],
)
class $AppRouter {}
