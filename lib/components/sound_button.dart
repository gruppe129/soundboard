// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:jojo/pages/favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';

class SoundButton extends StatelessWidget {
  final String text;
  final String path;

  final player = AudioPlayer();

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

  Future<void> onLongPress() async {
    final ByteData bytes = await rootBundle.load('assets/$path');
    await Share.file('sound', '${text.toLowerCase()}.mp3',
        bytes.buffer.asUint8List(), 'audio/*');
  }

  SoundButton({required this.text, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      onLongPress: onLongPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12), // color: Colors.white,
      ),
    );
  }
}
