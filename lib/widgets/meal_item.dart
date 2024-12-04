import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.mealItem, required this.onSelectMeal});

  final MealModel mealItem;
  final void Function(MealModel meal) onSelectMeal;

  String get complexityText {
    switch (mealItem.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (mealItem.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectMeal(mealItem),
        // when pressing in certain meal, its details will be shown in details scree ,
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Stack(
              // alignment: AlignmentDirectional.bottomCenter,
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: mealItem.imageUrl,
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    color: Colors.black54,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Text(
                      mealItem.title,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    // duration data
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 20.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        mealItem.duration.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'min',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  // complexity
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        size: 20.0,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        complexityText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  // price affordability
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 20.0,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        affordabilityText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
