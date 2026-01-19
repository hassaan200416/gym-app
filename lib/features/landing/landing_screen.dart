/// Main landing page screen that composes all landing page sections.
/// 
/// This screen serves as the entry point of the application and displays:
/// - Hero section with main headline and CTA
/// - Features section showcasing key benefits
/// - Waitlist section for email collection
/// 
/// All sections are stacked vertically with consistent spacing and wrapped
/// in a scrollable view for mobile responsiveness.
import 'package:flutter/material.dart';
import 'widgets/hero_section.dart';
import 'widgets/features_section.dart';
import 'widgets/waitlist_section.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const SizedBox(height: 48),
            FeaturesSection(),
            const SizedBox(height: 48),
            const WaitlistSection(),
          ],
        ),
      ),
    );
  }
}
