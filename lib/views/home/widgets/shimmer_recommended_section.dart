import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/l10n/l10n.dart';
import 'package:e_learning_app/views/home/widgets/shimmer_recommended_course_card.dart';
import 'package:flutter/material.dart';

class ShimmerRecommendedSection extends StatelessWidget {
  const ShimmerRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context)!.recommendedCourses,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: null,
                child: Text(S.of(context)!.seeAll),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: ShimmerRecommendedCourseCard(),
                ),
          ),
        ),
      ],
    );
  }
}
