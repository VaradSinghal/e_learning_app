import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RecommendationsCard extends StatelessWidget {
  final List<String> recommendations;

  const RecommendationsCard({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Next Steps',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...recommendations.map((recommendation) {
            return Padding(padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(
                  recommendation,
                  style: const  TextStyle(fontSize: 14),
                ))
              ],
            ),
            );
          }),
        ],
      ),
    );
  }
}
