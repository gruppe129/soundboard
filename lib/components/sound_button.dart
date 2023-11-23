// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import 'package:share_plus/share_plus.dart';

class SoundButton extends StatelessWidget {
  final String text;
  final String path;

  final player;

  void playFile(String file) async {
    await player.play(AssetSource(path));
  }

  void onClick() {
    if (player.state == PlayerState.playing) {
      player.stop();
    } else {
      playFile(path);
    }
  }

  void onLongPress() async {
    print(path);
    final audio = await rootBundle.load("assets/$path");
    final buffer = audio.buffer;
    Share.shareXFiles([
      XFile.fromData(
          buffer.asUint8List(
          audio.offsetInBytes, 
          audio.lengthInBytes),
          name: path,
          mimeType: "audio/mpeg")
    ]);
    }

  const SoundButton(
      {required this.text,
      required this.path,
      required this.player,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      onLongPress: onLongPress,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}