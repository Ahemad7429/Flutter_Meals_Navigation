import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_navigation/screens/screens.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilter;
  final Map<String, bool> currentFilter;

  const FiltersScreen({
    Key key,
    @required this.setFilter,
    @required this.currentFilter,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filters = {
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                };
                widget.setFilter(filters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (value) {
                    setState(
                      () {
                        _glutenFree = value;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (value) {
                    setState(
                      () {
                        _lactoseFree = value;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (value) {
                    setState(
                      () {
                        _vegetarian = value;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (value) {
                    setState(
                      () {
                        _vegan = value;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
