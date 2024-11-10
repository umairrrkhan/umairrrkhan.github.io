import 'package:flutter/material.dart';
import 'dart:math' show Random, cos, sin;

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> with TickerProviderStateMixin {
  final skills = [
    {
      'title': 'Machine Learning & AI',
      'skills': [
        'TensorFlow', 'PyTorch', 'Scikit-learn', 'Keras',
        'OpenCV', 'YOLO', 'MediaPipe', 'Image Processing',
        'BERT', 'Transformers', 'spaCy', 'NLTK',
        'Python', 'Java', 'OpenCV', 'NumPy',
        'pandas', 'Plotly Express','Text Preprocessing', 'Model Training',
         'Model Evaluation', 'Deep Learning', 'Computer Vision', 'NLP'
      ],
      'icon': Icons.psychology,
    },
  ];

  final List<Sparkle> sparkles = [];
  late final AnimationController _sparkleController;

  @override
  void initState() {
    super.initState();
    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  void _addSparkles(Offset position) {
    setState(() {
      for (int i = 0; i < 10; i++) {
        sparkles.add(Sparkle(
          position: position,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          angle: Random().nextDouble() * 2 * 3.14,
          speed: Random().nextDouble() * 100 + 50,
        ));
      }
    });
    _sparkleController.forward(from: 0).then((_) {
      setState(() {
        sparkles.clear();
      });
    });
  }

  @override
  void dispose() {
    _sparkleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(64),
          child: Column(
            children: [
              _buildAnimatedTitle(),
              const SizedBox(height: 48),
              Center(
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: List.generate(
                    skills.length,
                    (index) => _buildAnimatedSkillCard(
                      skills[index]['title'] as String,
                      skills[index]['skills'] as List<String>,
                      skills[index]['icon'] as IconData,
                      index,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Sparkle layer
        ...sparkles.map((sparkle) => AnimatedBuilder(
          animation: _sparkleController,
          builder: (context, child) {
            final progress = _sparkleController.value;
            final dx = sparkle.position.dx + cos(sparkle.angle) * sparkle.speed * progress;
            final dy = sparkle.position.dy + sin(sparkle.angle) * sparkle.speed * progress - 
                      (200 * progress * progress); // Adds arc to movement
            
            return Positioned(
              left: dx,
              top: dy,
              child: Opacity(
                opacity: 1 - progress,
                child: Icon(
                  Icons.star,
                  color: sparkle.color,
                  size: 20 * (1 - progress),
                ),
              ),
            );
          },
        )),
      ],
    );
  }

  Widget _buildAnimatedTitle() {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: const Text(
              'Machine Learning & AI',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedSkillCard(
      String title, List<String> skills, IconData icon, int index) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1600 + (index * 400)),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: GestureDetector(
            onTapDown: (details) {
              _addSparkles(details.globalPosition);
            },
            child: MouseRegion(
              onEnter: (_) => setState(() {}),
              onExit: (_) => setState(() {}),
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black54.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(icon, size: 48, color: Colors.white),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: skills.map((skill) => _buildSkillChip(skill)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
      ),
      child: Text(
        skill,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class Sparkle {
  final Offset position;
  final Color color;
  final double angle;
  final double speed;

  Sparkle({
    required this.position,
    required this.color,
    required this.angle,
    required this.speed,
  });
} 