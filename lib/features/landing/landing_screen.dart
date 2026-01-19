import 'package:flutter/material.dart';
import 'widgets/hero_section.dart';
import 'widgets/features_section.dart';
import 'widgets/waitlist_section.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const SizedBox(height: 24),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: const FeaturesSection(),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: const WaitlistSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
