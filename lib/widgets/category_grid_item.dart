import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category_model.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meals_screen.dart';
import '../screens/filters_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.categoryModel,
      required this.onToggleFavourite});

  final CategoryModel categoryModel;
  final void Function(MealModel meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // when pressing in certain category, its meals will be shown in meals screen
        final List<MealModel> meals = dummyMeals
            .where(
              (meal) => meal.categories.contains(categoryModel.id),
            )
            .toList();
        for (int i = 0; i < meals.length; i++) {
          print('${meals[i].title} $i lactose free is ${meals[i].isLactoseFree}');
          print('${meals[i].title} $i vegetarian is ${meals[i].isVegetarian}');
          print('${meals[i].title} $i vegan is ${meals[i].isVegan}');
          print('${meals[i].title} $i gluten free is ${meals[i].isGlutenFree}');
          print('--------------------------');
        }
        // selected filters from filters screen
        final List<MealModel> filteredMeals = meals.where(
          (meal) {
            bool isVisible = true;
            if (!meal.isVegan && selectedFilters[Filters.vegan]!) {
              isVisible = false;
            }
            if (!meal.isVegetarian && selectedFilters[Filters.vegetarian]!) {
              isVisible = false;
            }
            if (!meal.isGlutenFree && selectedFilters[Filters.glutenFree]!) {
              isVisible = false;
            }
            if (!meal.isLactoseFree && selectedFilters[Filters.lactoseFree]!) {
              isVisible = false;
            }
            return isVisible;
          },
        ).toList();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            categoryTitle: categoryModel.title,
            meals: filteredMeals,
            onToggleFavourite: onToggleFavourite,
          ),
        ));
      },
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(0.5),
              categoryModel.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
