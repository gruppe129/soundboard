// Flutter imports:
import 'dart:convert';

import "package:flutter/material.dart";

import 'dart:io';
import 'dart:async';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<String> sounds = [
    'soft and wet',
    'hey baby',
    'arigato Gyro',
    'Dojyaaan',
    'Mr Joestar',
    'oi Josuke',
  ];

  Future<void> _getSounds() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('sounds/'))
        .where((String key) => key.contains('.mp3'))
        .toList();

    setState(() {
      for (var i = 0; i < imagePaths.length; i++) {
        imagePaths[i] = imagePaths[i].split("/")[3].replaceAll(".mp3", "");

        // man muss nach ordner untewrscheiden können aber dafür müsste man
        // verstehen wie String methods funktionieren und die scheie ordentlich
        // formatieren
        /*
        switch (imagePaths[i].replaceAll(RegExp('[^0-9,.]+'), '')) {
          case "0": imagePaths[i] = "0/$imagePaths[i]";
            break;
          default: imagePaths[i] = imagePaths[i];
        }
        */
      }

      sounds = imagePaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getSounds();
    return FractionallySizedBox(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...sounds.map(
              (sound) => SoundButton(
                text: sound.toUpperCase(),
                path: "sounds/0/$sound.mp3",  // 0,1,... müssen automatisch kommen ↑
              ),
            )
          ],
        ),
      ),
    );
  }
}
// hallo

/*

return Column(
      children: <Widget>[
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...sounds.map(
              (sound) => SoundButton(
                text: sound.toUpperCase(),
                path: "sounds/0/$sound.mp3",  // 0,1,... müssen automatisch kommen ↑
              ),
            )
          ],
        ),
        GestureDetector(
            onTap: () {
              _getSounds();
            },
            child: Text("ausführen")),
      ],
    );


*/
