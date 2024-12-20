import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import '../models/meal_model.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavourite});
  
  final void Function(MealModel meal) onToggleFavourite;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 3 / 2,
        ),
        children: dummyCategories
            .map(
              (e) => CategoryGridItem(
                categoryModel: e, onToggleFavourite: onToggleFavourite,
              ),
            )
            .toList(),
      ),
    );
  }
}
