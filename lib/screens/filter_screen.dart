import 'package:eight_project/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function filterHandler;
  final Map<String, bool> currentFilters;

  const FilterScreen(
      {Key? key, required this.filterHandler, required this.currentFilters})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget buildSwitchListTile(
    String title,
    bool switchValue,
    String description,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      value: switchValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.filterHandler(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile('Gluten-Free', _glutenFree,
                      'Only include gluten-free meals', (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  buildSwitchListTile('Lactose-Free', _lactoseFree,
                      'Only include lactose-free meals', (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegan', _vegan, 'Only include vegan meals', (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegetarian', _vegetarian, 'Only include vegan meals',
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
