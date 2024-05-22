
import 'package:flutter/material.dart';

import 'favorites_page.dart';
import 'list_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int _selectedIndex=0;

  static const List<Widget> _widgetOptions = <Widget>[
    listPage(),
    favoritesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The best memes of the year'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Memes"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites"
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
       _selectedIndex=index;
    });
  }
}
