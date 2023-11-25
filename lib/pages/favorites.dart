// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import 'package:audioplayers/audioplayers.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);

  List<String> sounds = [
    'soft and wet',
    'hey baby',
    'arigato Gyro',
    'Dojyaaan',
    'Mr Joestar',
    'oi Josuke',
    'OraOra'
  ];
  @override
  Widget build(BuildContext context) {
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
        )
      ],
    );
  }
}
