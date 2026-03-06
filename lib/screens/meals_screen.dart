import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/recipe_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;
  void _selectMeal(Meal meal, BuildContext context) {
        // Handle meal tap
        // Navigate to the recipe screen for this meal
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(meal: meal),
          ),
        );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isNotEmpty
          ? ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return MealItem(meal: meals[index], onTap: () => _selectMeal(meals[index], context));
              },
            )
          : const Center(child: Text('No meals found for the selected category.')),
    );
  }
}
