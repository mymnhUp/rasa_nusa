
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const RasaNusaApp());
}

class RasaNusaApp extends StatelessWidget {
  const RasaNusaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RasaNusa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}
