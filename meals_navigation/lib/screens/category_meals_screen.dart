import 'package:flutter/material.dart';
import 'package:meals_navigation/models/models.dart';
import 'package:meals_navigation/widgets/widgets.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routesArg['title'];
      final categoryId = routesArg['id'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
          );
        },
      ),
    );
  }
}
