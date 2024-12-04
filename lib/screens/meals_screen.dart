import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.categoryTitle,
      required this.onToggleFavourite});

  final List<MealModel> meals;
  final String? categoryTitle;
  final void Function(MealModel meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return categoryTitle == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: meals
                  .map((e) => MealItem(
                        mealItem: e,
                        onSelectMeal: (meal) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => MealDetailsScreen(
                              mealItem: meal,
                              onToggleFavourite: onToggleFavourite,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(categoryTitle! + ' Food'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: meals
                    .map(
                      (e) => MealItem(
                        mealItem: e,
                        onSelectMeal: (meal) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => MealDetailsScreen(
                              mealItem: meal,
                              onToggleFavourite: onToggleFavourite,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
