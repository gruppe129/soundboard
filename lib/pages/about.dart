import "package:flutter/material.dart";

// about:

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.code),
          onPressed: () {
            
          },
        )
      ),
    );
  }
}
