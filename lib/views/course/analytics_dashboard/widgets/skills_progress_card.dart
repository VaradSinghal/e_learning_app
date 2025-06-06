import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SkillsProgressCard extends StatelessWidget {
  final Map<String, double> skillsProgress;
  const SkillsProgressCard({super.key, required this.skillsProgress});

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
            'Skills Progress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...skillsProgress.entries.map((skill) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        skill.key,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      '${(skill.value*100).toInt()}%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: skill.value,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 16),
              ],
            );
          }),
        ],
      ),
    );
  }
}
