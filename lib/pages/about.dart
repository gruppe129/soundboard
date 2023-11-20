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
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.code),
          onPressed: () {
            
          },
        )
      ),
    );
  }
}
