🍽️ Recipe Adda
A Flutter app that uses Google Gemini AI to generate recipes from photos of ingredients. Just snap a picture, and get a full recipe instantly.


Features

📸 Pick an image from your camera or gallery
🤖 AI-powered recipe generation using Google Gemini 2.5 Flash
✏️ Custom prompt support (e.g. "make it vegan" or "keep it under 30 mins")
🔖 Bookmark your favorite recipes with Hive CE local storage
🌙 Dark / Light mode with persistent theme preference
🗑️ Clear all data from Settings


Tech Stack   
Layer               Technology
Framework           Flutter
State Management    Riverpod
AI                  Google Gemini 2.5 Flash Lite API
Local Storage       Hive CE
HTTP Client         Dio
Theme Persistence   SharedPreferences
Image Picker        image_picker
Unique IDs          uuid

Environment Variables
Variable           Description
GEMINI_API_KEY     Google Gemini API key

Permissions
The following permissions are required in AndroidManifest.xml:
xml<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>


Dependencies
flutter_dotenv
flutter_riverpod
image_picker
path_provider
shared_preferences
hive_ce
uuid

