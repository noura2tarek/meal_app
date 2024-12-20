import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import '../models/meal_model.dart';
import 'filters_screen.dart';

const kInitialFilters = {
  Filters.glutenFree: true,
  Filters.vegan: true,
  Filters.vegetarian: true,
  Filters.lactoseFree: true,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

// contains categories and favourites screen
class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<MealModel> _favouriteMeals = [];

  // show snack bar message method
  _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message'),
      ),
    );
  }

  // toggle favourite method
  void _onToggleFavourite(MealModel meal) {
    var isFavourite = _favouriteMeals.contains(meal);
    if (isFavourite) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showMessage('This item Removed from favourites');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showMessage('This item added to favourites successfullly!');
    }
  }

  // on select index method
  void _onSelectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) =>  FiltersScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _currentScreen = CategoriesScreen(
      onToggleFavourite: _onToggleFavourite,
    );
    String _title = 'Pick your category';

    if (_selectedIndex == 1) {
      setState(() {
        _currentScreen = MealsScreen(
          meals: _favouriteMeals,
          onToggleFavourite: _onToggleFavourite,
        );
        _title = 'Favourites';
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _currentScreen,
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _onSelectIndex(value),
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
