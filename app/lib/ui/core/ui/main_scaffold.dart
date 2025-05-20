import 'package:first_flutter_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffold();
}

class _MainScaffold extends State<MainScaffold> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String route;

    switch (selectedIndex) {
      case 0:
        route = Routes.home;
      case 1:
        route = Routes.favorites;
      default:
        throw UnimplementedError("No Widget for $selectedIndex");
    }

    return Scaffold(
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
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });

                      context.go(route);
                    },
                  ),
                ),
                Expanded(child: widget.child),
              ],
            );
          },
        ),
      ),
    );
  }
}
