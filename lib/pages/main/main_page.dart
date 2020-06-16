import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/pages/application/app_localizations.dart';
import 'package:flutter_clean_architecture/pages/movies_list/movies_list.dart';
import 'package:flutter_clean_architecture/pages/setting/setting_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MoviesListPage(),
    Text(
      'Index 1: Favorite',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context).translate('home');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies), title: Text(AppLocalizations.of(context).translate('Movies'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text(AppLocalizations.of(context).translate('Favorite'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text(AppLocalizations.of(context).translate('Search'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text(AppLocalizations.of(context).translate('Setting'))),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
