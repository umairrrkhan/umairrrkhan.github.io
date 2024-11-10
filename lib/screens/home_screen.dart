import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';

final projectsKey = GlobalKey();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(projectsKey: projectsKey),
                const AboutSection(),
                const SkillsSection(),
                const ExperienceSection(),
                ProjectsSection(key: projectsKey),
                const ContactSection(),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
} 