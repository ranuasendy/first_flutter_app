import 'package:first_flutter_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class MainScaffold extends StatefulWidget {
//   final Widget child;
//   const MainScaffold({super.key, required this.child});

//   @override
//   State<MainScaffold> createState() => _MainScaffold();
// }

class NavItem {
  final String path;
  final IconData icon;
  final String label;

  const NavItem({required this.path, required this.icon, required this.label});
}

const List<NavItem> destinations = [
  NavItem(path: "/", icon: Icons.home, label: "Home"),
  NavItem(path: "/favorites", icon: Icons.favorite, label: "Favorites"),
];

class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).state.uri.toString();
    final selectedIndex = destinations.indexWhere((item) {
      if (item.path == '/') {
        return location == '/';
      }
      return location.startsWith(item.path);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations:
                        destinations
                            .map(
                              (item) => NavigationRailDestination(
                                icon: Icon(item.icon),
                                label: Text(item.label),
                              ),
                            )
                            .toList(),
                    selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
                    onDestinationSelected: (index) {
                      context.go(destinations[index].path);
                    },
                  ),
                ),
                Expanded(child: child),
              ],
            );
          },
        ),
      ),
    );
  }
}
