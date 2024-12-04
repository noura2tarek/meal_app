import 'package:flutter/material.dart';
import '../widgets/custom_switch.dart';

// selected filters from filters screen
const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
  Filters.lactoseFree: false,
};

Map<Filters, bool> selectedFilters = kInitialFilters;

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenSwitchValue = false,
      _veganSwitchValue = false,
      _vegetarianSwitchValue = false,
      _lactoseSwitchValue = false;

  @override
  void initState() {
    _glutenSwitchValue = selectedFilters[Filters.glutenFree]!;
    _veganSwitchValue = selectedFilters[Filters.vegan]!;
    _vegetarianSwitchValue = selectedFilters[Filters.vegetarian]!;
    _lactoseSwitchValue = selectedFilters[Filters.lactoseFree]!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       //nav to home screen (meals)
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (ctx) => TabsScreen(),
      //       ));
      //     }
      //   },
      // ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          setState(() {
            selectedFilters = {
              Filters.glutenFree: _glutenSwitchValue,
              Filters.vegan: _veganSwitchValue,
              Filters.vegetarian: _vegetarianSwitchValue,
              Filters.lactoseFree: _lactoseSwitchValue,
            };
          });
          print(selectedFilters);
        },
        child: Column(
          children: [
            CustomSwitch(
              onChanged: (value) {
                setState(() {
                  _glutenSwitchValue = value;
                });
              },
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              switchValue: _glutenSwitchValue,
            ),
            CustomSwitch(
              onChanged: (value) {
                setState(() {
                  _veganSwitchValue = value;
                });
              },
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              switchValue: _veganSwitchValue,
            ),
            CustomSwitch(
              onChanged: (value) {
                setState(() {
                  _vegetarianSwitchValue = value;
                });
              },
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              switchValue: _vegetarianSwitchValue,
            ),
            CustomSwitch(
              onChanged: (value) {
                setState(() {
                  _lactoseSwitchValue = value;
                });
              },
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              switchValue: _lactoseSwitchValue,
            ),
          ],
        ),
      ),
    );
  }
}
