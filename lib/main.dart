// Dart imports:
import 'dart:io';
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:jojo/components/theme.dart';
import 'package:jojo/components/theme_provider.dart';
import 'package:jojo/pages/favorites.dart';
import 'package:jojo/pages/home.dart';
import 'package:jojo/pages/more.dart';

// wichtig: flutter run -d web-server
//          flutter build apk --release

void main() => runApp(const MyApp());

int randomNumber = Random().nextInt(29) + 1;
String number = (randomNumber > 9 ? randomNumber : "0$randomNumber").toString();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangerProvider = ThemeProvider();

  void getTheme() async {
    themeChangerProvider.setDarkTheme =
        await themeChangerProvider.themePrefs.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangerProvider;
        })
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'JoJo Soundboard',
            theme: themeProvider.getDarkTheme == true ? darkMode : lightMode,
            home: const NavigationSite(),
          );
        },
      ),
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
              'assets/images/jojo/$number.png',
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
