// Flutter imports:
import "package:flutter/material.dart";
// about:

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'dies ist ein text bitt geben sie mir einen stern auf github dies wäre sehr erwünscht diese applikation ist ein meisterwerk'),
            IconButton(
                onPressed: null, icon: Icon(Icons.code)), // github öffnen
            Text("1.0.0")
          ], // Children
        ),
      ),
    );
  }
}
