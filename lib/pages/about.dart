// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import "package:url_launcher/url_launcher.dart";

// about:

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: ListView(
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(top: 50),
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            ListTile(
              title: const Text("Version"),
              subtitle: const Text("1.3.1"),
              onTap: () {},
              leading: const Icon(Icons.adb),
            ),
            ListTile(
              onTap: () {
                launchUrl(
                  Uri.parse("https://github.com/kommindiegruppe/soundboard"),
                );
              },
              leading: const Icon(Icons.code),
              title: const Text("Source Code"),
            ),
          ],
        ),
      ),
    );
  }
}
