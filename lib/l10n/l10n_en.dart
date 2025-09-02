// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'E-Learning App';

  @override
  String welcome(Object name) {
    return 'Welcome $name';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navCourses => 'My Courses';

  @override
  String get navQuizzes => 'Quizzes';

  @override
  String get navProfile => 'Profile';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get loading => 'Loading...';

  @override
  String get categories => 'Categories';

  @override
  String courses(Object count) {
    return '$count Courses';
  }

  @override
  String get searchCourses => 'Search courses...';

  @override
  String get inProgress => 'In Progress';

  @override
  String progressPercent(Object percent) {
    return 'Progress: $percent%';
  }

  @override
  String get proLabel => 'PRO';

  @override
  String get recommended => 'Recommended';

  @override
  String get seeAll => 'See All';

  @override
  String get noCoursesAvailable => 'No Courses available';

  @override
  String get unknownInstructor => 'Unknown Instructor';

  @override
  String error(Object message) {
    return 'Error: $message';
  }

  @override
  String get recommendedCourses => 'Recommended Courses';
}
