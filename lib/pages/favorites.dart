// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import 'package:audioplayers/audioplayers.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SoundButton(
        text: "Soft&Wet", path: "sounds/softandwet.mp3", player: player);
  }
}
