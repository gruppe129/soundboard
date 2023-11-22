// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:jojo/pages/favorites.dart';
import 'package:jojo/pages/home.dart';
import 'package:jojo/pages/more.dart';

// wichtig: flutter run -d web-server

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoJo Soundboard',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 47, 69, 200),
          secondary: Color.fromARGB(255, 158, 175, 203),
        ),
        useMaterial3: true,
      ),
      home: const NavigationSite(),
    );
  }
}

class NavigationSite extends StatefulWidget {
  const NavigationSite({super.key});

  @override
  State<NavigationSite> createState() => _NavigationSiteState();
}

class _NavigationSiteState extends State<NavigationSite> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: const Text('JoJo Soundboard'),
            ),
            Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            tooltip: '',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
            tooltip: '',
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'More',
            tooltip: '',
            selectedIcon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: <Widget>[const Home(), Favorites(), const More()][currentPageIndex],
    );
  }
}
