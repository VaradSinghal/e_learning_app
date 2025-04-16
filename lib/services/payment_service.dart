import 'package:e_learning_app/services/dummy_data_service.dart';
import 'package:e_learning_app/views/course/payment/widgets/payment_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class PaymentService {
  static void processPayment({
    required GlobalKey<FormState> formKey,
    required String courseId,
  }) {
    if (formKey.currentState!.validate()) {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      Future.delayed(const Duration(seconds: 2), () {
        Get.back();

        DummyDataService.addPurchasedCourse(courseId);

        Get.dialog(
          const PaymentSuccessDialog(),
          barrierDismissible: false,
        );
      });
    }
  }
}
