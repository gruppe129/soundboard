import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:share_plus/share_plus.dart';

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

  void onLongPress() {}

  const SoundButton({required this.text, required this.path, required this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: ElevatedButton(
          onPressed: onClick,
          onLongPress: onLongPress,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

/* old code for playing a sound, maybe outdated

import 'package:esys_flutter_share/esys_flutter_share.dart';

Future<void> onLongPress(BuildContext context) async {
    final ByteData bytes =
        await rootBundle.load('assets/sounds/$sType/$type/$path');
    await Share.file('', '$path', bytes.buffer.asUint8List(), 'audio/mpeg');
  }
*/