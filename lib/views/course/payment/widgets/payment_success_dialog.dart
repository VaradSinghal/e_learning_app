import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.primary, size: 64),
            const SizedBox(height: 16),
            Text(
              'Payment Successfull!',
              style: Get.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              'You can now access the course contents',
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Start Learning',
                onPressed: () {
                  Get.back();
                    Get.back();
                },
                height: 56,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
