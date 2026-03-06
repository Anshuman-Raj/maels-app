import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap;
  const MealItem({super.key, required this.meal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        splashColor: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.black.withValues(alpha: 0.5),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      spacing: 8.0,
                      children: [
                        Icon(Icons.access_time_outlined,
                            size: 16, color: Colors.white),
                        Text(
                          meal.duration > 0 ? "${meal.duration} minutes" : "",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                              )
                          ),
                          Icon(Icons.work_outline,
                            size: 16, color: Colors.white),
                          Text(
                          meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1),
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                              )
                          ),
                          Text(
                          meal.affordability == Affordability.affordable ? "£" : meal.affordability == Affordability.pricey ? "££" : "£££",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                              )
                          ),
                          if (meal.isGlutenFree)
                            Text(
                                "GF",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                    )
                                ),
                          if (meal.isLactoseFree)
                            Text(
                              "LF",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  )
                              ),
                          if (meal.isVegan)
                            Text(
                            "VE",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                )
                            ),
                          if (meal.isVegetarian)
                            Text(
                            "VG",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                )
                            ),
                          
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}