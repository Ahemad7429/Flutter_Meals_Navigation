import 'package:flutter/material.dart';
import 'package:meals_navigation/models/meal.dart';
import 'package:meals_navigation/widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key key, @required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (favoriteMeals.isEmpty)
        ? Center(
            child: Text('You have no favorites yet - start adding some!'),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                complexity: favoriteMeals[index].complexity,
                duration: favoriteMeals[index].duration,
                affordability: favoriteMeals[index].affordability,
              );
            },
          );
  }
}
