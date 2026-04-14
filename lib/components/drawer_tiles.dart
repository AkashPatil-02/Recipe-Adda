import 'package:flutter/material.dart';

class DrawerTiles extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;


  const DrawerTiles({super.key, required this.text,required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(title: Text(text),leading: Icon(icon,color: Theme.of(context).colorScheme.primary),onTap: onTap,),
    );
  }
}