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
      home: const LandingScreen(),
    );
  }
}
