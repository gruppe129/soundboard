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
        child: ListView(

          padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      margin: EdgeInsets.only(top: 50, bottom: 10),
                      child: Image(image: AssetImage('images/logo.png')),
                    ),
                    
                    ListTile(
                      title: const Text('General'),
                      leading: const Icon(Icons.tune),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Appearance'),
                      leading: const Icon(Icons.palette),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Advanced'),
                      leading: const Icon(Icons.error),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                    ),


                  ],
        ),
      ),
    );
  }
}
