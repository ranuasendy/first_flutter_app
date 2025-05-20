import 'package:first_flutter_app/ui/favorites/view_models/favorites_viewmodel.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key, required this.viewModel});

  final FavoritesViewmodel viewModel;

  @override
  State<FavoritesScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FavoritesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Text("Test FavoritesScreen"),
    );
  }
}
