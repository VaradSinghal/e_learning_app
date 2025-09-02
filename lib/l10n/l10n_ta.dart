// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class STa extends S {
  STa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'மின்கற்றல் பயன்பாடு';

  @override
  String welcome(Object name) {
    return 'வரவேற்கிறோம் $name';
  }

  @override
  String get navHome => 'முகப்பு';

  @override
  String get navCourses => 'என் பாடங்கள்';

  @override
  String get navQuizzes => 'வினாடி வினா';

  @override
  String get navProfile => 'சுயவிவரம்';

  @override
  String get welcomeBack => 'மீண்டும் வருகைக்கு வரவேற்கிறோம்';

  @override
  String get loading => 'சுமை செய்கிறது...';

  @override
  String get categories => 'வகைகள்';

  @override
  String courses(Object count) {
    return '$count பாடங்கள்';
  }

  @override
  String get searchCourses => 'பாடங்களை தேடு...';

  @override
  String get inProgress => 'முன்னேற்றத்தில்';

  @override
  String progressPercent(Object percent) {
    return 'முன்னேற்றம்: $percent%';
  }

  @override
  String get proLabel => 'ப்ரோ';

  @override
  String get recommended => 'பரிந்துரைக்கப்பட்டவை';

  @override
  String get seeAll => 'அனைத்தையும் பார்க்கவும்';

  @override
  String get noCoursesAvailable => 'பாடங்கள் இல்லை';

  @override
  String get unknownInstructor => 'தெரியாத பயிற்றுநர்';

  @override
  String error(Object message) {
    return 'பிழை: $message';
  }

  @override
  String get recommendedCourses => 'பரிந்துரைக்கப்பட்ட பாடங்கள்';
}
