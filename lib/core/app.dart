/// Root application widget that configures MaterialApp and global settings.
/// 
/// This widget sets up the application's theme, routing, and initial screen.
/// It serves as the central configuration point for the entire application.
import 'package:flutter/material.dart';
import '../features/landing/landing_screen.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Landing',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      home: const LandingScreen(),
    );
  }
}
