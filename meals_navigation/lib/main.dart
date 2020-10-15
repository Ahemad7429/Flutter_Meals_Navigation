import 'package:flutter/material.dart';
import 'package:meals_navigation/data/dummy_data.dart';
import 'package:meals_navigation/models/models.dart';
import 'package:meals_navigation/screens/screens.dart';
import './config/navigation_paths.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'vegan': false,
    'vegetarian': false,
    'gluten': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meals Navigation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: CategoriesScreen(),
      //initialRoute: '/' default is '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        NavigationPath.categoryMealsScreen: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        NavigationPath.mealDetailsScreen: (ctx) => MealDetailsScreen(),
        NavigationPath.filtersScreen: (ctx) => FiltersScreen(
              currentFilter: _filters,
              setFilter: _setFilters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   switch (settings.name) {
      //     case NavigationPath.categoryMealsScreen:
      //     return ...;
      //     break;

      //   }
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
