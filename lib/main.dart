import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Film.dart';
import 'NewsListState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyBottomBar(title: 'The to watch'),
    );
  }
}

class MyBottomBar extends StatefulWidget {
  final String title;
  MyBottomBar({Key key, this.title}) : super(key: key);

  @override
  _MyBottomBar createState() => _MyBottomBar();
}

class _MyBottomBar extends State<MyBottomBar> {
  static final myController = TextEditingController();

  static String query;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget> [
    Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            Container(
              width: 230,
              constraints: BoxConstraints(minWidth: 230.0, minHeight: 25.0),
              child: TextField(
                controller: myController,
              ),
            ),
          ),
          Expanded(child: NewsList()),
        ]),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPress() async{
    await NewsListState().fetchPost(myController.text);
  }

  FloatingActionButton fab () {
    return FloatingActionButton(
      // When the user presses the button, show an alert dialog containing
      // the text that the user has entered into the text field.
      onPressed: _onPress,
      tooltip: 'Show me the value!',
      child: Icon(Icons.text_fields),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: fab(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_movies),
              title: Text('Last releases'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped
      ),
    ),
    );
  }
}