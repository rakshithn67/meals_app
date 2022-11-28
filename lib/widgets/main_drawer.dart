import 'package:eight_project/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 100,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            title: Text(
              'Meals',
              style: GoogleFonts.robotoCondensed(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
            title: Text(
              'Filters',
              style: GoogleFonts.robotoCondensed(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
