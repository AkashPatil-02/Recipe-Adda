import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:recipe_generator/providers/theme_provider.dart';
import 'package:recipe_generator/screens/dash.dart';
import 'themes/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async{
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box1 = Hive.openBox('bookmarks');

  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child:MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: isDark ? ThemeMode.dark: ThemeMode.light,
      home:const DashScreen()
    );
  }
}
