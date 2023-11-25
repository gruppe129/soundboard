// Flutter imports:
import "package:flutter/material.dart";
import 'package:jojo/components/theme.dart';
import 'package:jojo/components/theme_provider.dart';

// Project imports:
import 'package:jojo/pages/about.dart';
import 'package:provider/provider.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _SettingsState();
}

class _SettingsState extends State<More> {
  @override
  Widget build(BuildContext context) {
    bool theme = Provider.of<ThemeProvider>(context).themeData == darkMode
        ? true
        : false;

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(top: 50, bottom: 10),
              child: Image(image: AssetImage('images/logo.png')),
            ),
            ListTile(
              title: const Text('General'),
              leading: const Icon(Icons.tune),
              onTap: () {},
            ),
            SwitchListTile(
                value: theme,
                title: const Text('Switch Theme'),
                secondary: Icon(theme ? Icons.light_mode : Icons.dark_mode),
                onChanged: (bool value) {
                  setState(() {
                    theme = value;
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
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
