import 'dart:async';
import 'dart:convert';
import 'dart:math';

// Flutter imports:
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

// Project imports:
import "package:jojo/components/sound_button.dart";


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("favorites gibt es noch nicht"),
      ),
    );
  }

}
