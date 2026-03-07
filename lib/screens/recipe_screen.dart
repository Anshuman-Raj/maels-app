import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/recipe.dart';

class RecipeScreen extends StatefulWidget{
  final Meal meal;
  const RecipeScreen({super.key, required this.meal});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  void _selectFavourite() {
    // Handle favorite toggle
    favourites.contains(widget.meal) ? favourites.remove(widget.meal) : favourites.add(widget.meal);
    SnackBar snackBar = SnackBar(
      content: Text(favourites.contains(widget.meal) ? 'Added to favorites' : 'Removed from favorites'),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Icon icon = favourites.contains(widget.meal) ? const Icon(Icons.star) : const Icon(Icons.star_border); 
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.meal.title} Recipe"),
        actions: [
          IconButton(
            icon: icon,
            onPressed: _selectFavourite,
          )
        ],

      ),
      body: Recipe(meal: widget.meal),
    );
  }
}