import 'package:flutter/material.dart';
import 'package:jojo/pages/favorites.dart';
import 'package:jojo/pages/home.dart';
import 'package:jojo/components/AppDrawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoJo Soundboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('JoJo Soundboard'),
        backgroundColor: Colors.black38,
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
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            tooltip: '',
          ),
        ],
      ),
      body: <Widget>[
        Home(),
        Favorites(),
      ][currentPageIndex],
    );
  }
}
