// Flutter imports:
import "package:flutter/material.dart";
import "package:jojo/components/theme.dart";

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home>{

      


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: Center(child: Text("hier kann alles von favorites rein")),
    );


  }
}




/*
     
 // TapBar // https://stackoverflow.com/a/58194473

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode,    // keine ahnung wie man das mit dem theme provider macht
      home: DefaultTabController(
        length: 7,    // tapbar tabs 
        child: Scaffold(

          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  const TabBar(
                    tabs: [
                      Text("0"), 
                      Text("1"), 
                      Text("2"), 
                      Text("3"), 
                      Text("4"), 
                      Text("5"), 
                      Text("6")
                      ],
                      isScrollable: true,
                  ),
                ],
              ),
            ),
          ),

           body: const TabBarView(
            children: <Widget>[
              Column(
                children: <Widget>[Text("0")],
              ),
              Column(
                children: <Widget>[Text("1")],
              ),
              Column(
                children: <Widget>[Text("2")],
              ),
              Column(
                children: <Widget>[Text("3")],
              ),
              Column(
                children: <Widget>[Text("4")],
              ),
              Column(
                children: <Widget>[Text("5")],
              ),
              Column(
                children: <Widget>[Text("6")],
              ),
            ],
          ),

        ),
      ),
    );

  }


*/