import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/recipe.dart';

class RecipeScreen extends StatelessWidget{
  final Meal meal;
  const RecipeScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title} Recipe"),
      ),
      body: Recipe(meal: meal),
    );
  }
}