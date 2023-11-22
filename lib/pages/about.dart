// Flutter imports:
import "package:flutter/material.dart";
import 'package:package_info_plus/package_info_plus.dart';
// about:

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  var _version = "...";

  // @TODO: test if this works on android/ios
  void getVersion() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      _version = packageInfo.version;
    });
  }

  _AboutState() {
    getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'dies ist ein text bitt geben sie mir einen stern auf github dies wäre sehr erwünscht diese applikation ist ein meisterwerk'),
            const IconButton(
                onPressed: null, icon: Icon(Icons.code)), // github öffnen
            Text(_version)
          ], // Children
        ),
      ),
    );
  }
}
