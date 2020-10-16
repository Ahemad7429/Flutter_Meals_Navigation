import 'package:flutter/material.dart';
import 'package:meals_navigation/data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailsScreen({
    Key key,
    @required this.toggleFavorite,
    @required this.isFavorite,
  }) : super(key: key);

  Widget _buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
