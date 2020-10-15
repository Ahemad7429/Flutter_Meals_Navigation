import 'package:flutter/material.dart';
import 'package:meals_navigation/config/navigation_paths.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final MaterialColor color;

  const CategoryItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  void navigateToCategoryMeals(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(NavigationPath.categoryMealsScreen, arguments: {
      'title': title,
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToCategoryMeals(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
