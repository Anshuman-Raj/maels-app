import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
            
            children: [
            Icon(Icons.fastfood, 
            size: 48, 
            color: Theme.of(context).colorScheme.onPrimaryContainer),
            SizedBox(width: 20),Text('Cooking Up!', 
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer
            ),
            ),
            ],
          )
          ),
        ],
      ),
    );
  }
}