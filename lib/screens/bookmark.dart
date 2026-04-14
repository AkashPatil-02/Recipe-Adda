import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recipe_generator/components/drawer.dart';
import 'package:recipe_generator/screens/bookmarked_recipe.dart';
import 'package:recipe_generator/services/hive.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final _hive = HiveServices();
  late List<Map<String, dynamic>> _bookmarks;

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  void _loadBookmarks() {
    setState(() {
      _bookmarks = _hive.readAll();
    });
  }

  void _delete(String id) {
    _hive.deleteData(id);
    _loadBookmarks(); 
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bookmark removed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: _bookmarks.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No bookmarks yet',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _bookmarks.length,
              itemBuilder: (context, index) {
                final item = _bookmarks[index];
                final id = item['id'] as String;
                final imagePath = item['imagePath'] as String;
                final recipe = Map<String, dynamic>.from(item['recipe']);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>BookmarkedRecipe(
                          recipe: recipe,
                          image: File(imagePath),
                        ),
                      ),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(imagePath),
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
              
                        errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
                      ),
                    ),
                    title: Text(
                      recipe['title'] ?? 'Recipe',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      recipe['difficulty'] ?? '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _delete(id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}