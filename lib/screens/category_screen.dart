import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_container.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.selectFavourite});
  final void Function(Meal meal) selectFavourite;

  void _selectCategory(Category category, BuildContext context) {
        // Handle category tap
        // Navigate to the meals screen for this category
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsScreen(
              title: category.title,
              meals: dummyMeals.where((meal) => meal.categories.contains(category.id)).toList(),
              selectFavourite: selectFavourite,
            ),
          ),
        );
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryContainer(category: dummyCategories[index],
              onTap: () => _selectCategory(dummyCategories[index], context),
            ),
          );
        },
      ),
    );
  }
}
