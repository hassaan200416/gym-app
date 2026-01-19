/// Hero section widget displaying the main headline, value proposition, and CTA button.
/// 
/// This section features:
/// - Full-screen background image with dark gradient overlay
/// - Animated entrance effects (fade and slide)
/// - Responsive layout (web vs mobile)
/// - Animated CTA button with hover effects and pulse animation
/// - Smooth scroll-to-waitlist functionality
import 'package:flutter/material.dart';
import '../../../../widgets/buttons/primary_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final isWeb = MediaQuery.of(context).size.width > 800;
    final heroHeight = screenHeight * 0.9;

    return Container(
      width: double.infinity,
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWeb ? 48 : 24,
              vertical: 0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Align(
                  alignment: isWeb ? Alignment.centerLeft : Alignment.center,
                  child: isWeb
                      ? _buildWebLayout(context, colorScheme)
                      : _buildMobileLayout(context, colorScheme),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the background image with error handling.
  Widget _buildBackgroundImage() {
    return Image.asset(
      'assets/images/hero_1.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(color: Colors.black);
      },
    );
  }

  /// Builds the web layout with entrance animations.
  Widget _buildWebLayout(BuildContext context, ColorScheme colorScheme) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: _buildTextContent(context, colorScheme, isWeb: true),
      ),
    );
  }

  /// Builds the mobile layout with entrance animations.
  Widget _buildMobileLayout(BuildContext context, ColorScheme colorScheme) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: _buildTextContent(context, colorScheme, isWeb: false),
      ),
    );
  }

  /// Builds the text content including headline, subheadline, description, and CTA.
  Widget _buildTextContent(BuildContext context, ColorScheme colorScheme, {required bool isWeb}) {
    return Column(
      crossAxisAlignment: isWeb ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'One Stop\nGym Solution',
          textAlign: isWeb ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: isWeb ? 72 : 52,
            fontWeight: FontWeight.w900,
            height: 1.1,
            letterSpacing: -1.5,
            color: Colors.white,
            shadows: [
              Shadow(
                color: colorScheme.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
              Shadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 15,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Manage workouts, members, and progress in one powerful platform.',
          textAlign: isWeb ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: isWeb ? 24 : 20,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.95),
            height: 1.5,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Launching soon. Join the waitlist to be notified.',
          textAlign: isWeb ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: const Color(0xFFFF8FA3),
            height: 1.4,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildCTAButton(context, isWeb, colorScheme),
      ],
    );
  }

  /// Builds the call-to-action button with scroll-to-waitlist functionality.
  Widget _buildCTAButton(BuildContext context, bool isWeb, ColorScheme colorScheme) {
    return _AnimatedCTAButton(
      label: 'Join the Waitlist',
      isWeb: isWeb,
      colorScheme: colorScheme,
      onPressed: () {
        final scrollController = Scrollable.maybeOf(context);
        if (scrollController != null) {
          scrollController.position.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}

/// Animated CTA button with pulse effect and hover interactions.
/// 
/// Features:
/// - Continuous pulse animation
/// - Hover state with gradient transition
/// - Responsive sizing for web and mobile
class _AnimatedCTAButton extends StatefulWidget {
  final String label;
  final bool isWeb;
  final ColorScheme colorScheme;
  final VoidCallback onPressed;

  const _AnimatedCTAButton({
    required this.label,
    required this.isWeb,
    required this.colorScheme,
    required this.onPressed,
  });

  @override
  State<_AnimatedCTAButton> createState() => _AnimatedCTAButtonState();
}

class _AnimatedCTAButtonState extends State<_AnimatedCTAButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(12),
        child: ScaleTransition(
          scale: _pulseAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: widget.isWeb ? 48 : 40,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isHovered
                    ? [
                        widget.colorScheme.primary,
                        widget.colorScheme.secondary,
                      ]
                    : [
                        widget.colorScheme.primary,
                        widget.colorScheme.primary.withOpacity(0.8),
                      ],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: widget.colorScheme.primary.withOpacity(_isHovered ? 0.6 : 0.4),
                  blurRadius: _isHovered ? 20 : 12,
                  offset: Offset(0, _isHovered ? 8 : 4),
                ),
              ],
            ),
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
