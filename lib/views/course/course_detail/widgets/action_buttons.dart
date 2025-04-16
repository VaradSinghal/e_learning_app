import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/services/dummy_data_service.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final Course course;

  const ActionButtons({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child:
        ElevatedButton.icon(
          onPressed: (){
            if(course.isPremium && !DummyDataService.isCourseUnlocked(course.id)){

            } else {

            }
          },
          label:  const Text('Start Learning'),
          icon: const Icon(Icons.play_circle),
          ),
          ),

          if (!course.isPremium || DummyDataService.isCourseUnlocked(course.id))...{
            const SizedBox(width: 16),
            IconButton(onPressed: (){
              //chat screen
            },
            icon: const Icon(Icons.chat),
            ),
          },
      ],
    );
  }
}
