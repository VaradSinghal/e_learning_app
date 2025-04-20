import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/views/help_and_support/widgets/contact_tile.dart';
import 'package:e_learning_app/views/help_and_support/widgets/faq_tile.dart';
import 'package:e_learning_app/views/help_and_support/widgets/help_search_bar.dart';
import 'package:e_learning_app/views/help_and_support/widgets/help_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text(
          'Help & Support',
          style:TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: ()=> Get.back(), 
          icon: Icon(Icons.arrow_back, color: Colors.white,
          ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,           
            ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HelpSearchBar(),
              SizedBox(height: 24),
              HelpSection(
                title: 'Frequently Asked Questions',
                children: [
                FaqTile(
                    question: 'How do I reset my password?',
                    answer: 'Go to the login page and tap on "Forgot Password". Follow the instructions to reset your password.',
                  ),
                FaqTile(
                    question: 'How do I download courses for offline viewing ?',
                    answer: 'Open the course you want to download, tap on the download icon, and select the videos you want to save for offline viewing.',
                  ), 
                FaqTile(
                    question: 'Can I get a refund ?',
                    answer: 'Yes, within 30 days of purchase, you can request a refund by contacting our support team.',
                  ), 
                ],
              ),
              SizedBox(height: 24),
              HelpSection(
                title: 'Contact Us',
                children: [
                ContactTile(
                  title: 'Email Support',
                  subtitle: 'Get help via email',
                  icon: Icons.email_outlined,
                  onTap: (){},
                ),
                ContactTile(
                  title: 'Live Chat',
                  subtitle: 'Chat with our support team',
                  icon: Icons.chat_outlined,
                  onTap: (){},
                ),
                ContactTile(
                  title: 'Call Us',
                  subtitle: 'Speak with a representative',
                  icon: Icons.phone_outlined,
                  onTap: (){},
                ),
                ],
              ),
            ],
          ),
          ),
      ),
    );
  }
}