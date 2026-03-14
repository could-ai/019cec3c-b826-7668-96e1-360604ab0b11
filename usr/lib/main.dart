import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AIStudyAssistantApp());
}

class AIStudyAssistantApp extends StatelessWidget {
  const AIStudyAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Study Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5), // Indigo
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      // CRITICAL: Routing safety - explicitly setting initialRoute and registering '/'
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
