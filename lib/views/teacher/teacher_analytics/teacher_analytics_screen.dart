import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/views/teacher/teacher_analytics/widgets/enrollment_chart_widget.dart';
import 'package:e_learning_app/views/teacher/teacher_analytics/widgets/over_view_cards_widget.dart';
import 'package:e_learning_app/views/teacher/teacher_analytics/widgets/revenue_stats_widget.dart';
import 'package:e_learning_app/views/teacher/teacher_analytics/widgets/student_engagement_widget.dart';
import 'package:e_learning_app/views/teacher/teacher_analytics/widgets/teacher_analysis_app_bar.dart';
import 'package:flutter/material.dart';

class TeacherAnalyticsScreen extends StatelessWidget {
  const TeacherAnalyticsScreen({super.key});
  final String instructorId = 'inst_1';
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
      slivers: [
        const TeacherAnalysisAppBar(),
        SliverToBoxAdapter(
          child: Padding(padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverViewCardsWidget(
                instructorId: instructorId,
              ),
              const SizedBox(height: 24),
              EnrollmentChartWidget(instructorId: instructorId),
              const SizedBox(height: 24),
              const RevenueStatsWidget(),
              const SizedBox(height: 24),
              StudentEngagementWidget(instructorId: instructorId),
            ],
          ),
          ),
        ),
      ],
      ),
        );
  }
}
