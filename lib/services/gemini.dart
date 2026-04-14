import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final Dio _dio;
  final String _apiKey = dotenv.env['GEMINI_API_KEY']!;
  final String _baseUrl =
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent';

  GeminiService() : _dio = Dio();

  Future<Map<String, dynamic>> getRecipeFromImage(File imageFile,String customization) async {
    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      final mimeType = _getMimeType(imageFile.path);

      final payload = {
        "contents": [
          {
            "parts": [
              {
                "inline_data": {
                  "mime_type": mimeType,
                  "data": base64Image,
                }
              },
              {
                "text": '''
You are a recipe assistant. Analyze the food ingredients in this image and return a recipe in the following JSON format only, no extra text.
${customization.isNotEmpty ? 'User customization request: $customization' : ''} detailed steps required
{
  "title": "Recipe Name",
  "description": "Short description",
  "ingredients": ["ingredient 1", "ingredient 2"],
  "steps": ["step 1", "step 2"],
  "prep_time": "10 mins",
  "cook_time": "20 mins",
  "servings": 2,
  "difficulty": "Easy"
}
'''
              }
            ]
          }
        ]
      };

      final response = await _dio.post(
        '$_baseUrl?key=$_apiKey',
        data: payload,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final text = response.data['candidates'][0]['content']['parts'][0]['text'];
        final cleaned = text.replaceAll('```json', '').replaceAll('```', '').trim();
        return jsonDecode(cleaned);
      } else {
        throw Exception('Gemini API error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to get recipe: $e');
    }
  }

  String _getMimeType(String path) {
    final ext = path.split('.').last.toLowerCase();
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'webp':
        return 'image/webp';
      default:
        return 'image/jpeg';
    }
  }
}