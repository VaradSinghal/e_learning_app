import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/views/privacy_&_terms_conditions/widgets/legal_document_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(), 
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last Updated: April 20, 2025',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 24),
            LegalDocumentSection(
              title: '1. Information We Collect',
              content: 'We collect information that you provide directly to us, including but not limited to your name, email address, and learning preferences  when you register for an account',
            ),
            LegalDocumentSection(
              title: '2. How We Use Your Information',
              content: 'We use the infromation we collect to provide, maintain and improve our services, to develop new ones, and to protect our users',
            ),
            LegalDocumentSection(
              title: '3. Data Security',
              content: 'We implemet appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction',
            ),
            LegalDocumentSection(
              title: '4. Your Rights',
              content: 'You have the right to access, correct, or delete your personal information. You can also object to or restrict the processing of your personal information',
            ),
          ],
        ),
      ),
    );
  }
}