import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/services/payment_service.dart';
import 'package:e_learning_app/views/course/payment/widgets/order_summary.dart';
import 'package:e_learning_app/views/course/payment/widgets/payment_fields.dart';
import 'package:e_learning_app/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  final String courseId;
  final String courseName;
  final double price;

  const PaymentScreen({
    super.key,
    required this.courseId,
    required this.courseName,
    required this.price,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _nameController = TextEditingController();
  final _errorStyle = const TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSummary(courseName: widget.courseName, price: widget.price),
            const SizedBox(height: 24),
            PaymentFields(
              formKey: _formKey,
              cardNumberController: _cardNumberController,
              expiryController: _expiryController,
              cvvController: _cvvController,
              nameController: _nameController,
              errorStyle: _errorStyle,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Pay \$${widget.price}',
              onPressed:
                  () => PaymentService.processPayment(
                    formKey: _formKey,
                    courseId: widget.courseId,
                  ),
                  isLoading: false,
                  height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
