import 'dart:async';
import 'dart:convert';
import 'dart:math';

// Flutter imports:
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";
import 'package:shared_preferences/shared_preferences.dart';

List<String> allSounds = [], shownSounds = [];

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool loaded = false;

  Future<void> _getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? favorites = prefs.getStringList("favorites");
    setState(() {
      allSounds = favorites!;
      shownSounds = allSounds;
      loaded = true;
    });
  }

  Future<void> _deleteSoundFromFavorites(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? favorites = prefs.getStringList("favorites");
    favorites!.remove(path);
    prefs.setStringList("favorites", favorites);
    setState(() {
      allSounds = favorites;
      shownSounds = allSounds;
    });
  }

  @override
  void initState() {
    super.initState();
    _getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return (loaded == true && allSounds.isNotEmpty)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: const Text('Favorites'),
                  ),
                ],
              ),
            ),
            body: GridView.builder(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 4),
              itemCount: shownSounds.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('removed from favorites'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    setState(() {
                      // remove from favorites
                      _deleteSoundFromFavorites(shownSounds[index]);
                    });
                  },
                  child: SoundButton(
                    text: shownSounds[index]
                        .split("/")[2]
                        .replaceAll(".mp3", "")
                        .toUpperCase(),
                    path: shownSounds[index],
                  ),
                );
              },
            ),
          )
        : Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: const Center(
              child: Text(
                "Double tap on a sound to add it to favorites. Double tap on an added sound to remove it. ",
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
