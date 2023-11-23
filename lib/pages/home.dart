// Flutter imports:
import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ColoredBox(
          color: Colors.red,
          child: SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
          )),
    );
  }
}
