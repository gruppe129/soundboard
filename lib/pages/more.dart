// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:jojo/components/theme.dart';
import 'package:jojo/components/theme_provider.dart';
import 'package:jojo/pages/about.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _SettingsState();
}

class _SettingsState extends State<More> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(top: 50, bottom: 10),
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            SwitchListTile(
                value: themeState.getDarkTheme,
                title: const Text('Switch Theme'),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.light_mode
                    : Icons.dark_mode),
                onChanged: (bool val) {
                  setState(() {
                    themeState.setDarkTheme = val;
                  });
                }),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.error),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const About(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
