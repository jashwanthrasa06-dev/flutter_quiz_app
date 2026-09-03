import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FlutterQuizApp());
}

class FlutterQuizApp extends StatelessWidget {
  const FlutterQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: MaterialApp(
        title: 'Flutter Quiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF4F46E5),
          brightness: Brightness.dark,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
