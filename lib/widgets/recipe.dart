import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class Recipe extends StatelessWidget {
  final Meal meal;
  const Recipe({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final children = [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Duration: ${meal.duration} minutes', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, 
              color: Theme.of(context).colorScheme.onSurface)
              ),
          ),
          ListTile(
            title: Text('Ingredients', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, 
              color: Theme.of(context).colorScheme.onSurface)
              ),
            subtitle: Text(meal.ingredients.join(', ')),
          ),
           ListTile(
            title: Text('Steps', 
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, 
              color: Theme.of(context).colorScheme.onSurface)
              ),
            subtitle: Column(children: [
              for (var step in meal.steps) 
                ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(step),
                )
            ],),
          ),
        ];
    return ListView(
        children: children,
      );
  }
}