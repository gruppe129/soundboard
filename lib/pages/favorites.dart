import "package:flutter/material.dart";
import "package:jojo/components/SoundButton.dart";
import 'package:audioplayers/audioplayers.dart';

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SoundButton(
        text: "Soft&Wet", path: "sounds/softandwet.mp3", player: player);
  }
}
