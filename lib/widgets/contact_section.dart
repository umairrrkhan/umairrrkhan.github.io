import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(64),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      child: Column(
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          const Text(
            "Let's work together on something great!",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactButton(
                'Copy Email',
                Icons.email,
                'umairh@gmail.com',
                isCopyEmail: true,
              ),
              const SizedBox(width: 32),
              _buildContactButton(
                'LinkedIn',
                FontAwesomeIcons.linkedin,
                'https://www.linkedin.com/in/umairkhannn/',
              ),
              const SizedBox(width: 32),
              _buildContactButton(
                'GitHub',
                Icons.code,
                'https://github.com/umairrrkhan',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(String label, IconData icon, String link, {bool isCopyEmail = false}) {
    return Builder(
      builder: (context) => ElevatedButton.icon(
        onPressed: () {
          if (isCopyEmail) {
            Clipboard.setData(ClipboardData(text: link)).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Email copied to clipboard!'),
                  duration: Duration(seconds: 2),
                ),
              );
            });
          } else {
            _launchURL(link);
          }
        },
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  void _launchURL(String link) async {
    final Uri url = link.startsWith('http') 
        ? Uri.parse(link)
        : Uri.parse('mailto:$link');
        
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: link.startsWith('http') 
            ? LaunchMode.externalApplication 
            : LaunchMode.platformDefault,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
} 