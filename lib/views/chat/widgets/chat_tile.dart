import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/models/chat_message.dart';
import 'package:e_learning_app/views/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ChatTile extends StatelessWidget {
  final ChatMessage lastMessage;
  final String? studentName;

  const ChatTile({super.key, required this.lastMessage, this.studentName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>ChatScreen(
        courseId: lastMessage.courseId, 
        instructorId: lastMessage.receiverId, 
        isTeacherView: true,
        studentName: studentName,
        ),
         ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade100)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Text(
                studentName?.substring(0, 1).toUpperCase() ?? 'U',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    studentName ?? 'Unknown Student',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(_formatTimestamp(lastMessage.timestamp), style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            )),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}hrs ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }
}
