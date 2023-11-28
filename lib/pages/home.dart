// Flutter imports:
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// herzlichen wilkommen und viel spaß mit diesem meisterwerk
//
// wenn man in die suchleiste was schreibt wird gesucht aber man kann
// den eingegebenen text nicht lesen. 
// der fehlerteufel befindet sich in zeile 48 oder so

class _HomeState extends State<Home> {
  List<String> liste1 = [
    "eins",
    "zwei",
    "drei",
    "vier",
    "fünf",
    "sechs",
    "sieben",
    "acht",
    "neun",
    "zehn",
    "elf",
    "zwölf",
    "dreizehn",
    "vierzehn",
    "fünfzehn",
    "sechzehn",
    "siebzehn",
    "achtzehn",
    "neunzehn",
    "zwanzig",
    "einundzwanzig",
  ];

      void searchInhalt(String query) {
      final suggestions = liste1.where((inhalt) {
        final inhaltLower = inhalt.toLowerCase();
        final queryLower = query.toLowerCase();

        return inhaltLower.contains(queryLower);
      }).toList();
      setState(() => liste1 = suggestions);   // hier ist der fehlerteufel
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: searchInhalt,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: liste1.length,
              itemBuilder: (BuildContext context, int index) {
                final inhalt = liste1[index];

                return ListTile(
                  leading: OutlinedButton(
                    onPressed: () {},
                    child: const Icon(Icons.play_arrow),
                  ),
                  title: Text(inhalt),
                );
              },
            ),
          )
        ],
      ),
    );


  }
}


/*

ColoredBox(
            color: Colors.deepOrange,
            child: SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),
          ),

*/