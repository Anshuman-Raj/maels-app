import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex = 0;

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectFavourite(Meal meal) {
    // Handle favorite toggle
    favourites.contains(meal) ? favourites.remove(meal) : favourites.add(meal);
    SnackBar snackBar = SnackBar(
      content: Text(favourites.contains(meal) ? 'Added to favorites' : 'Removed from favorites'),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(selectFavourite: _selectFavourite);
    String title = "Categories";
    if (_selectedIndex == 1) {
      title = "Favourites";
      activePage = MealsScreen(meals: favourites, selectFavourite: _selectFavourite);
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: activePage,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}