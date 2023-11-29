// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:math';

// Flutter imports:
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";

int randomNumber = Random().nextInt(29) + 1;
String number = (randomNumber > 9 ? randomNumber : "0$randomNumber").toString();

List<String> allSounds = [], shownSounds = [];

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
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

      allSounds = imagePaths;
      shownSounds = allSounds;
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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: const Text('Home'),
                  ),
                  Image.asset(
                    'assets/images/jojo/$number.png',
                    fit: BoxFit.contain,
                    height: 32,
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchBarDelegate(),
                    );
                  },
                ),
              ],
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
                return SoundButton(
                  text: shownSounds[index].split("/")[1].toUpperCase(),
                  path: "sounds/${shownSounds[index]}.mp3",
                );
              },
            ),
          )
        : const Text("loading");
  }
}


class SearchBarDelegate extends SearchDelegate{
    @override
    Widget? buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );
    }

    @override
    List<Widget>? buildActions(BuildContext context) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          },
        ),
      ];
    }

    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      final suggestions = allSounds
          .where((inhalt) => inhalt
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index].toUpperCase()),
            onTap: () {
              query = suggestions[index];
              showResults(context);
            },
          );
        },
      );
    } 
  }

/* 
Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (String query) {
                      final suggestions = allSounds
                          .where((inhalt) => inhalt
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                          .toList();
                      setState(
                        () {
                          shownSounds = suggestions;
                        },
                      );
                    },
                  ),
                ),
*/
