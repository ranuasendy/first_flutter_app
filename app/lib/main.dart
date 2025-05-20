import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_development.dart' as development;

void main() {
  // runApp(MyApp());
  // development.main();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "First Flutter App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      routerConfig: router(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'First Flutter App',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();

//   void getNext() {
//     current = WordPair.random();
//     notifyListeners();
//   }

//   var favorites = <WordPair>[];

//   void toggleFavorite() {
//     if (favorites.contains(current)) {
//       favorites.remove(current);
//     } else {
//       favorites.add(current);
//     }
//     notifyListeners();
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     Widget page;

//     switch (selectedIndex) {
//       case 0: 
//         page = GeneratorPage();
//       case 1:
//         page = FavoritesPage();
//       default:
//         throw UnimplementedError("No Widget for $selectedIndex");
//     }

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           body: Row(
//             children: [
//               SafeArea(
//                 child: NavigationRail(
//                   extended: constraints.maxWidth >= 600,
//                   destinations: [
//                     NavigationRailDestination(
//                       icon: Icon(Icons.home),
//                       label: Text('Home'),
//                     ),
//                     NavigationRailDestination(
//                       icon: Icon(Icons.favorite),
//                       label: Text('Favorites'),
//                     ),
//                   ],
//                   selectedIndex: selectedIndex,
//                   onDestinationSelected: (value) {
//                     setState(() {
//                       selectedIndex = value;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Theme.of(context).colorScheme.primaryContainer,
//                   child: page,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }

// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//     required this.pair,
//   });

//   final WordPair pair;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!.copyWith(
//       color: theme.colorScheme.onPrimary,
//     );

//     return Card(
//       color: theme.colorScheme.primary,
//       elevation: 10,
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           pair.asLowerCase,
//           style: style,
//           semanticsLabel: "${pair.first} ${pair.second}",
//         ),
//       ),
//     );
//   }
// }

// class GeneratorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;

//     IconData icon;
//     Color iconColor;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//       iconColor = Colors.pink.shade200;
//     } else {
//       icon = Icons.favorite_border;
//       iconColor = theme.colorScheme.primary;
//     }

//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BigCard(pair: pair),
//           SizedBox(height: 15),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   appState.toggleFavorite();
//                 },
//                 label: Text('Like'),
//                 icon: Icon(
//                   icon,
//                   color: iconColor,
//                 ),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   appState.getNext();
//                 },
//                 child: Text('Next')
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final theme = Theme.of(context);
//     var appState = context.watch<MyAppState>();
//     var favorites = appState.favorites;
//     var index = 1;

//     if (favorites.isEmpty) {
//       return Center(
//         child: Text("No favorites yet."),
//       );
//     }

//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(6,10,6,10),
//               child: Text(
//                 "You have ${favorites.length} favorites:",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold
//                 ),
//               ),
//             ),
//             for (var fav in favorites) 
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 2.5),
//                 decoration: BoxDecoration(
//                   color: Colors.white70,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ListTile(
//                   title: Text(fav.asLowerCase),
//                   horizontalTitleGap: 10,
//                   leading: Icon(
//                     Icons.favorite,
//                     size: 15,
//                     color: Colors.pink.shade200,
//                   ),
//                   minLeadingWidth: 0,
//                   minTileHeight: 10,
//                   onTap: () => {
//                     print(fav)
//                   },
//                 ),
//               ),
//           ],
//         ),
//       )
//     );
//   }
// }