import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
