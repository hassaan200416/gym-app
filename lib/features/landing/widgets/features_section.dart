/// Features section displaying three key benefits with animated cards.
///
/// This section showcases:
/// - Find Nearby Gyms
/// - Track Your Diet
/// - Personalized Workouts
///
/// Features:
/// - Staggered entrance animations for each card
/// - Responsive layout (row on web, column on mobile)
/// - Hover effects with scale and elevation changes
/// - Image-based feature icons
library;

import 'package:flutter/material.dart';

class FeaturesSection extends StatefulWidget {
  const FeaturesSection({super.key});

  @override
  State<FeaturesSection> createState() => _FeaturesSectionState();
}

class _FeaturesSectionState extends State<FeaturesSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2,
            0.8 + index * 0.1,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    _slideAnimations = List.generate(3, (index) {
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2,
            0.8 + index * 0.1,
            curve: Curves.easeOut,
          ),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cards = [
            _FeatureCard(
              imagePath: 'assets/images/maps.png',
              title: 'Find Nearby Gyms',
              description: 'Discover gyms around you with ease.',
              theme: theme,
              fadeAnimation: _fadeAnimations[0],
              slideAnimation: _slideAnimations[0],
            ),
            _FeatureCard(
              imagePath: 'assets/images/track_diet.png',
              title: 'Track Your Diet',
              description: 'Stay aligned with your fitness goals.',
              theme: theme,
              fadeAnimation: _fadeAnimations[1],
              slideAnimation: _slideAnimations[1],
            ),
            _FeatureCard(
              imagePath: 'assets/images/personalized_workout.png',
              title: 'Personalized Workouts',
              description: 'Get workout plans tailored for you.',
              theme: theme,
              fadeAnimation: _fadeAnimations[2],
              slideAnimation: _slideAnimations[2],
            ),
          ];

          final isWide = constraints.maxWidth > 800;

          return Column(
            children: [
              Text(
                'Why You Will Love It',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              if (isWide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: cards[0]),
                    const SizedBox(width: 24),
                    Expanded(child: cards[1]),
                    const SizedBox(width: 24),
                    Expanded(child: cards[2]),
                  ],
                )
              else
                Column(
                  children: [
                    cards[0],
                    const SizedBox(height: 24),
                    cards[1],
                    const SizedBox(height: 24),
                    cards[2],
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Individual feature card with image, title, and description.
///
/// Includes hover effects:
/// - Scale transformation on hover
/// - Vertical translation (lift effect)
/// - Enhanced shadow with theme color
/// - Image scale animation
class _FeatureCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final ThemeData theme;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const _FeatureCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.theme,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.fadeAnimation,
      child: SlideTransition(
        position: widget.slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedScale(
            scale: _isHovered ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            child: Transform.translate(
              offset: Offset(0.0, _isHovered ? -8.0 : 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovered
                          ? widget.theme.colorScheme.primary.withValues(
                              alpha: 0.3,
                            )
                          : Colors.black.withValues(alpha: 0.3),
                      blurRadius: _isHovered ? 20 : 12,
                      offset: Offset(0, _isHovered ? 12 : 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        child: AnimatedScale(
                          scale: _isHovered ? 1.1 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: Image.asset(
                            widget.imagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      widget.theme.colorScheme.primary
                                          .withValues(alpha: 0.3),
                                      widget.theme.colorScheme.secondary
                                          .withValues(alpha: 0.3),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.fitness_center,
                                    size: 64,
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: widget.theme.textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              widget.description,
                              style: widget.theme.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
