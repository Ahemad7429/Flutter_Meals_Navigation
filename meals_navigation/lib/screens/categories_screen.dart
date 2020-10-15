import 'package:flutter/material.dart';
import 'package:meals_navigation/data/dummy_data.dart';
import 'package:meals_navigation/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
      ),
    );
  }
}
