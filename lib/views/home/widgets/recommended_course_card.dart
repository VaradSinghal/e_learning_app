import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedCourseCard extends StatelessWidget {
  final String courseId;
  final String title;
  final String imageUrl;
  final String instrucutorId;
  final String duration;
  final bool isPremium;
  const RecommendedCourseCard({super.key, required this.courseId, required this.title, required this.imageUrl, required this.instrucutorId, required this.duration, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16,bottom: 5),
      decoration: BoxDecoration(
        color:  AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: ()=> Get.toNamed(
            AppRoutes.courseDetail.replaceAll(':id',courseId),
            arguments: courseId,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 90,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: AppColors.primary.withOpacity(0.1), 
                        highlightColor: AppColors.accent,
                        child: Container(
                          height: 90,
                          width: double.infinity,
                          color: Colors.white,
                        ), 
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.primary.withOpacity(0.1),
                          child: const Icon(Icons.error),
                        ),
                      ),
                  ),
                  if(isPremium)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              'PRO',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            )
                        ],
                      ),
                    )
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 14,
                          color: AppColors.secondary,
                        ),
                        const SizedBox(
                          width: 4
                        ),
                        Text(
                          'Instructor ${instrucutorId}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.secondary,
                          ),
                        )
                      ],
                    ),
                     const SizedBox(height: 4),
                     Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 14,
                          color: AppColors.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                     )
                  ],
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
