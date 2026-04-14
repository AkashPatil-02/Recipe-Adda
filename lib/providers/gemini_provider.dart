import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:recipe_generator/services/gemini.dart';

final geminiServiceProvider = Provider((ref) => GeminiService());

// image
final imageProvider = StateProvider<File?>((ref) => null);

// gemini
final recipeProvider = FutureProvider.family<Map<String, dynamic>, (File,String)>((ref, params) async {
  final service = ref.read(geminiServiceProvider);
  final (imageFile, customPrompt) = params;
  return await service.getRecipeFromImage(imageFile,customPrompt);
});