# 🍽️ Recipe Adda

A Flutter app that uses Google Gemini AI to generate recipes from photos of ingredients. Just snap a picture, and get a full recipe instantly.

---

## Features

- 📸 Pick an image from your camera or gallery
- 🤖 AI-powered recipe generation using Google Gemini 2.5 Flash
- ✏️ Custom prompt support (e.g. "make it vegan" or "keep it under 30 mins")
- 🔖 Bookmark your favorite recipes with Hive CE local storage
- 🌙 Dark / Light mode with persistent theme preference
- 🗑️ Clear all data from Settings

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| State Management | Riverpod |
| AI | Google Gemini 2.5 Flash Lite API |
| Local Storage | Hive CE |
| HTTP Client | Dio |
| Theme Persistence | SharedPreferences |
| Image Picker | image_picker |
| Unique IDs | uuid |

---
---


## Project Structure

```
lib/
├── main.dart                  # App entry point, Hive & dotenv init
├── themes/
│   └── theme.dart             # Light and dark theme config
├── providers/
│   ├── gemini_provider.dart   # imageProvider + recipeProvider
│   └── theme_provider.dart    # themeProvider (dark/light)
├── services/
│   ├── gemini.dart            # Gemini API integration via Dio
│   ├── hive.dart              # Hive CE CRUD operations
│   └── image_picker.dart      # Camera & gallery picker
├── screens/
│   ├── dash.dart              # Home screen
│   ├── recipe_screen.dart     # Recipe detail + bookmark
│   ├── bookmark.dart          # Saved recipes list
│   └── settings.dart          # Theme toggle + clear data
└── components/
    ├── drawer.dart            # Navigation drawer
    ├── drawer_tiles.dart      # Drawer list tile component
    └── meta.dart              # Recipe metadata chip (time, difficulty, etc.)
```

---

## Environment Variables

| Variable | Description |
|---|---|
| `GEMINI_API_KEY` | Your Google Gemini API key |

Make sure `.env` is listed under `assets` in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - .env
```

---

## Permissions

The following permissions are required in `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

