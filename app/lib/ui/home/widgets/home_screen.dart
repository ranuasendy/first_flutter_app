import 'package:first_flutter_app/ui/core/ui/big_card.dart';
import 'package:first_flutter_app/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewmodel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        var pair = widget.viewModel.pair;

        return Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigCard(pair: pair),
                SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // do something
                      },
                      label: Text('Like'),
                      icon: Icon(Icons.favorite),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        widget.viewModel.getNext();
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
