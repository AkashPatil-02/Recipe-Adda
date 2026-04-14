import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_generator/components/drawer.dart';
import 'package:recipe_generator/components/meta.dart';

class BookmarkedRecipe extends StatefulWidget {
  final Map<String, dynamic> recipe;
  final File image;
  const BookmarkedRecipe({super.key, required this.recipe, required this.image});

  @override
  State<BookmarkedRecipe> createState() => _BookmarkedRecipeState();
}

class _BookmarkedRecipeState extends State<BookmarkedRecipe> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe['title'] ?? 'Recipe'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    widget.image,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(widget.recipe['title'] ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(widget.recipe['description'] ?? '',
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Meta(label: widget.recipe['prep_time'] ?? '', icon: Icons.timer),
                    Meta(icon: Icons.local_fire_department, label: widget.recipe['cook_time'] ?? ''),
                    Meta(icon: Icons.people, label: '${widget.recipe['servings']} servings'),
                    Meta(icon: Icons.bar_chart, label: widget.recipe['difficulty'] ?? ''),
                  ],
                ),
                const SizedBox(height: 20),

                // Ingredients
                const Text('Ingredients',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...List<String>.from(widget.recipe['ingredients'] ?? []).map(
                  (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(children: [
                      const Icon(Icons.circle, size: 8),
                      const SizedBox(width: 8),
                      Expanded(child: Text(i)),
                    ]),
                  ),
                ),
                const SizedBox(height: 20),

                // Steps
                const Text('Steps',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...List<String>.from(widget.recipe['steps'] ?? [])
                    .asMap()
                    .entries
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 12,
                                child: Text('${e.key + 1}',
                                    style: const TextStyle(fontSize: 12))),
                            const SizedBox(width: 10),
                            Expanded(child: Text(e.value)),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}