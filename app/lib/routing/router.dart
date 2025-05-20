import 'package:first_flutter_app/routing/routes.dart';
import 'package:first_flutter_app/ui/core/ui/main_scaffold.dart';
import 'package:first_flutter_app/ui/favorites/view_models/favorites_viewmodel.dart';
import 'package:first_flutter_app/ui/favorites/widgets/favorites_screen.dart';
import 'package:first_flutter_app/ui/home/view_models/home_viewmodel.dart';
import 'package:first_flutter_app/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            final viewModel = HomeViewmodel();
            return HomeScreen(viewModel: viewModel);
          }
        ),
        GoRoute(
          path: Routes.favorites,
          builder: (context, state) {
            final viewModel = FavoritesViewmodel();
            return FavoritesScreen(viewModel: viewModel);
          }
        )
      ]
    )
  ]
);