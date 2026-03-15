import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/recipe.dart';

class RecipeScreen extends StatelessWidget{
  const RecipeScreen({
    super.key, 
    required this.meal, 
    required this.selectFavourite});
  final Meal meal;
  final void Function(Meal meal) selectFavourite;
  
  @override
  Widget build(BuildContext context) {
    Icon icon = favourites.contains(meal) ? const Icon(Icons.star) : const Icon(Icons.star_border);
    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title} Recipe"),
        actions: [
          IconButton(
            icon: icon,
            onPressed: () => selectFavourite(meal),
          )
        ],

      ),
      body: Recipe(meal: meal),
    );
  }
}