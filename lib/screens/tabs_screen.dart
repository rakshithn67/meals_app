import 'package:eight_project/screens/categories_screen_list.dart';
import 'package:eight_project/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMealHandler;

  const TabScreen({Key? key, required this.favoriteMealHandler})
      : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(
          favoritesMealHandler: widget.favoriteMealHandler,
        ),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const AppDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amberAccent,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
