
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
//          flutter pub run flutter_launcher_icons

void main() => runApp(const MyApp());


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
            debugShowCheckedModeBanner: !!!true,
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
      body: <Widget>[Home(), Favorites(), const More()][currentPageIndex],
    );
  }
}
