// Flutter imports:
import "package:flutter/material.dart";

import 'dart:io';
import 'dart:async';

// Package imports:
import 'package:audioplayers/audioplayers.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final List<String> sounds = [
    'soft and wet',
    'hey baby',
    'arigato Gyro',
    'Dojyaaan',
    'Mr Joestar',
    'oi Josuke',
    'OraOra'
  ];

  void getSounds() async {
    var systemTempDir = Directory('assets/sounds');
    await for (var entity
        in systemTempDir.list(recursive: true, followLinks: false)) {
      sounds.add(entity.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    getSounds();
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...sounds.map(
              (sound) => SoundButton(
                text: sound.toUpperCase(),
                path: "sounds/$sound.mp3",
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            getSounds();
          },
          child: Text("a"),
        )
      ],
    );
  }
}
