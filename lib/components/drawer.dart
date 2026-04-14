import 'package:flutter/material.dart';
import 'package:recipe_generator/components/drawer_tiles.dart';
import 'package:recipe_generator/screens/bookmark.dart';
import 'package:recipe_generator/screens/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(Icons.fastfood_rounded,size: 80,color: Theme.of(context).colorScheme.primary,),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary
            ),
          ),

          DrawerTiles(text: "HOME", icon: Icons.home, onTap: (){
            Navigator.popUntil(context, (route) => route.isFirst);            
          }
          ),
          
          DrawerTiles(text: "SAVED RECIPES", icon: Icons.bookmark, onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookmarksScreen()));
          }),
          DrawerTiles(text: "SETTINGS", icon: Icons.settings, onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
          }),
        ],
      ),
    );
  }
}