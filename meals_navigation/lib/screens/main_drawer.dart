import 'package:flutter/material.dart';
import 'package:meals_navigation/config/navigation_paths.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget _buildListTile({String title, IconData icon, Function handleTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: handleTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120 + MediaQuery.of(context).padding.top,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            handleTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          _buildListTile(
            title: 'Filters',
            icon: Icons.settings,
            handleTap: () {
              Navigator.pushReplacementNamed(
                  context, NavigationPath.filtersScreen);
            },
          ),
        ],
      ),
    );
  }
}
