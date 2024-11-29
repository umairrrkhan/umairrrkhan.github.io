import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(64),
      child: Column(
        children: [
          const Text(
            'Projects',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            children: const [
              ProjectCard(
                title: 'Anime Face Generation Using DCGAN',
                description: 'Generated anime faces using DCGAN with real-time training visualization. ',
                imageUrl: 'assets/images/project8.jpg',
                link: 'https://github.com/umairrrkhan/Anime-Face-Generation-Using-DCGAN',
              ),
              ProjectCard(
                title: 'Skin Cancer Classification',
                description: 'Developed a deep learning model to classify skin cancer images, using a labeled dataset and extensive preprocessing for accurate diagnosis. ',
                imageUrl: 'assets/images/project7.jpg',
                link: 'https://github.com/umairrrkhan/Skin-Cancer-Image-Classification-Using-TF',
              ),
              ProjectCard(
                title: 'End-to-End Text Processing and Generation using GPT-2',
                description: 'EnglishTextGen is a fine-tuned GPT-2 model trained on 39 million tokens, generating coherent and contextually relevant English text for various applications.',
                imageUrl: 'assets/images/project2.png',
                link: 'https://github.com/umairrrkhan/End-to-End-Text-Processing-and-Generation-using-GPT-2',
              ),
              ProjectCard(
                title: 'Making Text Images Readable Again',
                description: 'Enhance text image readability using Python and OpenCV with thresholding techniques. ',
                imageUrl: 'assets/images/project3.jpg',
                link: 'https://github.com/umairrrkhan/Making-Text-Images-Readable-Again-with-Python-and-OpenCV',
              ),
              ProjectCard(
                title: 'Playing Chrome Dino Game with Hand Gestures`',
                description: 'Play the Dino game using hand gestures detected by computer vision with OpenCV, offering a fun, interactive experience. ',
                imageUrl: 'assets/images/project1.jpg',
                link: 'https://github.com/umairrrkhan/Playing-Chrome-Dino-with-Hand-Signals',
              ),
              ProjectCard(
                title: 'Predicting Hotel Ratings from TripAdvisor Reviews',
                description: 'Predict hotel ratings from TripAdvisor reviews using an LSTM neural network for sentiment analysis ',
                imageUrl: 'assets/images/project6.jpg',
                link: 'https://github.com/umairrrkhan/LSTM-based-Hotel-Rating-Prediction-from-TripAdvisor-Reviews',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.link,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(isHovered ? 1.05 : 1.0),
        child: GestureDetector(
          onTap: () => _launchURL(widget.link),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: isHovered ? 20 : 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
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
    );
  }

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
} 
