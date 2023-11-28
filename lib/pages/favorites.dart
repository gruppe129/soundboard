// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<String> sounds = [];
  bool loaded = false;

  Future<void> _getSounds() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('sounds/'))
        .where((String key) => key.contains('.mp3'))
        .toList();

    setState(() {
      for (var i = 0; i < imagePaths.length; i++) {
        //imagePaths[i] = imagePaths[i].split("/")[2].replaceAll(".mp3", "");

        // $ordnerzahl/$name
        imagePaths[i] =
            "${imagePaths[i].split("/")[2]}/${imagePaths[i].split("/")[3].replaceAll(".mp3", "")}";
      }

      sounds = imagePaths;
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getSounds();
  }

  @override
  Widget build(BuildContext context) {
    return loaded == true
        ? Scaffold(
          body: ListView.separated(
            
            separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
            },
            
            padding: const EdgeInsets.all(10),
            itemCount: sounds.length,
            itemBuilder: (context, index) {
              return SoundButton(
                text: sounds[index].split("/")[1].toUpperCase(),
                path: "sounds/${sounds[index]}.mp3",
              );
            },
          )
        )
        : Text("loading");
  }
}





/*

  @override
  Widget build(BuildContext context) {
    return loaded == true
        ? Scaffold(
          body: ListView.separated(
            
            separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
            },

            padding: const EdgeInsets.all(10),
            itemCount: sounds.length,
            itemBuilder: (context, index) {
              return SoundButton(
                text: sounds[index].split("/")[1].toUpperCase(),
                path: "sounds/${sounds[index]}.mp3",
              );
            },
          )
        )
        : Text("loading");
  }



  @override
  Widget build(BuildContext context) {
    return loaded == true
        ? FractionallySizedBox(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ...sounds.map(
                    (sound) => SoundButton(
                      text: sound
                          .toString()
                          .split("/")[1]
                          .toUpperCase(), // string ab 2. zeichen, split geht nicht und ich finde keine bessere lösung
                      path: "sounds/$sound.mp3",
                    ),
                  ),
                ],
              ),
            ),
          )
        : Text("loading");
  }


*/