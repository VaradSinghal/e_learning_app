import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/l10n/l10n.dart';
import 'package:e_learning_app/views/home/widgets/shimmer_category_card.dart';
import 'package:flutter/material.dart';

class ShimmerCategorySection extends StatelessWidget {
  const ShimmerCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context)!.categories,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context,index) => ShimmerCategoryCard()),
        )
      ],
    );
  }
}