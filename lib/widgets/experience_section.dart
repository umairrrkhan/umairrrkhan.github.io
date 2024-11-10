import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(64),
      child: Column(
        children: [
          const Text(
            'Experience',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 64),
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Column(
                  children: [
                    _ExperienceItem(
                      isFirst: true,
                      experience: Experience(
                        role: 'Junior Software Engineer',
                        company: 'Quick Engineering Solutions',
                        period: 'Oct 2024 - Present',
                        description: [
                          'Web App Dev: Building a robust Python & Kivy app for real-time device connectivity ',
                          'Engineered seamless ESP32 and WiFi device integration, reducing data latency by 40% ',
                          'Real-Time Data: Using Arduino for instant data processing and display. ',
                        ],
                        technologies: ['Kviy', 'Arduino', 'ESP32', 'Python'],
                      ),
                    ),
                    _ExperienceItem(
                      experience: Experience(
                        role: 'Machine Learning Engineer Intern',
                        company: 'SpacePt',
                        period: 'Dec 2023 - Feb 2024',
                        description: [
                          'Improved system performance by upgrading and integrating the latest libraries, ensuring compatibility and reducing processing errors by 30%. ',
                          'Developed an inference class for efficient model deployment on images, streamlining the inference process ',
                          'Managing and ensuring accessibility of model files within the GitHub repository, providing support if needed ',
                        ],
                        technologies: ['Python', 'PyTorch', 'CNN'],
                      ),
                    ),
                    _ExperienceItem(
                      isLast: true,
                      experience: Experience(
                        role: 'Machine Learning Engineer Intern',
                        company: 'YBI Foundation',
                        period: 'Oct 2023 - Nov 2023',
                        description: [
                          'Collaborated on cutting-edge AI/ML projects, contributing to a 15% reduction in processing time for large datasets ',
                          'Applied data analysis and predictive modeling techniques in real-world scenarios, ',
                          ' enhancing AI algorithm accuracy through continuous optimization. ',
                        ],
                        technologies: ['Python', 'TensorFlow', 'Scikit-learn'],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Experience {
  final String role;
  final String company;
  final String period;
  final List<String> description;
  final List<String> technologies;

  Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.technologies,
  });
}

class _ExperienceItem extends StatefulWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const _ExperienceItem({
    required this.experience,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  State<_ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<_ExperienceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TimelineTile(
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        beforeLineStyle: LineStyle(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
        indicatorStyle: IndicatorStyle(
          width: 20,
          height: 20,
          indicator: _buildIndicator(),
        ),
        endChild: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(left: 32, bottom: 32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isHovered
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.white10,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.experience.role,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.experience.period,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.experience.company,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ...widget.experience.description.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• '),
                      Expanded(child: Text(item)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.experience.technologies
                    .map((tech) => _buildTechChip(tech))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isHovered
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
    );
  }

  Widget _buildTechChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 12,
        ),
      ),
    );
  }
} 