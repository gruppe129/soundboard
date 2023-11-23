// Flutter imports:
import "package:flutter/material.dart";

// Project imports:
import 'package:jojo/pages/about.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _SettingsState();
}

class _SettingsState extends State<More> {
  bool _theme = false;

  @override
  Widget build(BuildContext context) {
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
            ListTile(
              title: const Text('Appearance'),
              leading: const Icon(Icons.palette),
              onTap: () {},
            ),
            SwitchListTile(
              value: _theme,
              title: const Text('Switch Theme'),
              onChanged: (bool value) {
                setState(() {
                  _theme = value;
                });
              },
              secondary: Icon(_theme ? Icons.light_mode : Icons.dark_mode),
            ),
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
