import "package:flutter/material.dart";

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            
          },
        )
      ),
    );
  }
}
