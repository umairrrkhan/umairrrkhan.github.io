import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.projectsKey});

  final GlobalKey projectsKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hi, I'm Umair Khan",
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Junior Software Engineer'),
                TypewriterAnimatedText('Machine Learning Engineer'),
                TypewriterAnimatedText('Problem Solver'),
              ],
              repeatForever: true,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Find the projects section and scroll to it
              Scrollable.ensureVisible(
                projectsKey.currentContext!,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            child: const Text('View My Work'),
          ),
        ],
      ),
    );
  }
} 