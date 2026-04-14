// dash.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_generator/components/drawer.dart';
import 'package:recipe_generator/screens/recipe_screen.dart';
import 'package:recipe_generator/services/image_picker.dart';
import 'package:recipe_generator/providers/gemini_provider.dart';

class DashScreen extends ConsumerStatefulWidget {
  const DashScreen({super.key});

  @override
  ConsumerState<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends ConsumerState<DashScreen> {
  final TextEditingController _customize = TextEditingController();
  bool _submitted = false; 

  @override
  void dispose() {
    _customize.dispose();
    super.dispose();
  }

  void _submit(selectedImage) {
    if (selectedImage == null) return;
    setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(imageProvider);

    if (selectedImage != null && _submitted) {
      ref.listen(recipeProvider((selectedImage, _customize.text.trim())), (previous, next) {
        next.whenData((recipe) {
          setState(() => _submitted = false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeCard(recipe: recipe, image: selectedImage),
            ),
          );
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Adda"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.search, size: 90),
              const Text(
                "Upload a photo of the ingredients or a dish and get exciting recipe !",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              if (selectedImage != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    selectedImage,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: FilledButton(
                  onPressed: () => _showDialog(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 30),
                      Text("Take a photo", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              TextField(
                controller: _customize,
                decoration: const InputDecoration(
                  hintText: "Enter any customization, if required",
                ),
              ),

              const SizedBox(height: 16),

              if (selectedImage != null)
                FilledButton(
                  onPressed: () => _submit(selectedImage),
                  child: const Text("Generate Recipe", style: TextStyle(fontSize: 18)),
                ),

              const SizedBox(height: 32),

              if (selectedImage != null && _submitted)
                ref.watch(recipeProvider((selectedImage, _customize.text.trim()))).when(
                  loading: () => const CircularProgressIndicator(),
                  error: (e, _) => Text(
                    'Error: $e',
                    style: const TextStyle(color: Colors.red),
                  ),
                  data: (_) => const SizedBox.shrink(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose a source", textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final file = await ImagePickerService().pickFromCamera();
                if (file != null) {
                  ref.read(imageProvider.notifier).state = file;
                  setState(() => _submitted = false);
                }
              },
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final file = await ImagePickerService().pickFromGallery();
                if (file != null) {
                  ref.read(imageProvider.notifier).state = file;
                  setState(() => _submitted = false); // reset on new image
                }
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }
}