import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/views/notifications/widgets/notification_settings_section.dart';
import 'package:e_learning_app/views/notifications/widgets/notifications_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(), 
          icon: const Icon(Icons.arrow_back,
          color: Colors.white,
          ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationSettingsSection(),
                const SizedBox(height: 24),
                Text(
                  'Recent Notifications',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const NotificationsList(),
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}
