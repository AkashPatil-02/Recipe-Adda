import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_generator/providers/gemini_provider.dart';
import 'package:recipe_generator/providers/theme_provider.dart';
import 'package:recipe_generator/screens/dash.dart';
import 'package:recipe_generator/services/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _hive = HiveServices();

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Data ?", textAlign: TextAlign.center),
          content: const Text("This cannot be undone.", textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            const SizedBox(width: 85),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);

                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                _hive.clearAll();

                ref.invalidate(imageProvider);
                ref.invalidate(recipeProvider);
                ref.invalidate(themeProvider);

                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashScreen()),
                    (route) => false,
                  );
                }
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dark Mode', style: TextStyle(fontSize: 18)),
                      Switch(
                        value: isDark,
                        onChanged: (value) {
                          ref.read(themeProvider.notifier).toggleTheme(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 238, 183, 183),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: _showDeleteDialog,
                    child: Text(
                      "Clear Data",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}