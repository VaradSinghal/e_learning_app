import 'package:chewie/chewie.dart';
import 'package:e_learning_app/bloc/course/course_bloc.dart';
import 'package:e_learning_app/bloc/course/course_event.dart';
import 'package:e_learning_app/bloc/course/course_state.dart';
import 'package:e_learning_app/controllers/video_controller.dart';
import 'package:e_learning_app/core/theme/app_colors.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/views/course/lesson_screen/widgets/certificate_dialog.dart';
import 'package:e_learning_app/views/course/lesson_screen/widgets/resource_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LessonScreen extends StatefulWidget {
  final String lessonId;
  const LessonScreen({super.key, required this.lessonId});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final LessonVideoController _videoController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _videoController = LessonVideoController(
      lessonId: widget.lessonId,
      onLoadingChanged: (bool loading) {
        if (mounted) {
          setState(() => _isLoading = loading);
        }
      },
      onCertificateEarned: (Course course) {
        if (mounted) {
          _showCertificateDialog(context, course);
        }
      },
    );

    final courseId = Get.parameters['courseId'];
    if (courseId != null) {
      context.read<CourseBloc>().add(LoadCourseDetail(courseId));
    }
    _videoController.initializeVideo();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _showCertificateDialog(BuildContext context, Course course) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CertificateDialog(
          course: course,
          onDownload: () => _downloadCertificate(course),
        );
      },
    );
  }

  void _downloadCertificate(Course course) {
    Get.snackbar(
      'Certificate Ready!',
      'Your certificate for ${course.title} has been generated',
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is CourseInitial || state is CourseLoading) {
          return Scaffold(
            body: Center(child: const CircularProgressIndicator()),
          );
        }

        if (state is CourseError) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final courseId = Get.parameters['courseId'];
                      if (courseId != null) {
                        context.read<CourseBloc>().add(
                          LoadCourseDetail(courseId),
                        );
                      }
                    },
                    child: const Text('Reply'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is CoursesLoaded && state.selectedCourse != null) {
          final course = state.selectedCourse!;
          final lesson = course.lessons.firstWhere(
            (l) => l.id == widget.lessonId,
            orElse: () => course.lessons.first,
          );

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back),
              ),
              title: Text(
                lesson.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ),
            body: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child:
                      _isLoading
                          ? Container(
                            color: theme.colorScheme.surface,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                          : _videoController.chewieController != null
                          ? Chewie(
                            controller: _videoController.chewieController!,
                          )
                          : Container(
                            color: theme.colorScheme.surface,
                            child: const Center(
                              child: Text('Error loading video'),
                            ),
                          ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: theme.colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${lesson.duration} mins',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Description',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          lesson.description,
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Resources',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...lesson.resources.map(
                          (resource) => ResourceTile(
                            title: resource.title,
                            icon: _getIconForResourceType(resource.type),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: const CircularProgressIndicator()
          ),
        );
      },
    );
  }

  _getIconForResourceType(String type) {
    switch (type.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'zip':
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }
}
