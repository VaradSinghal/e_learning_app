// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class SHi extends S {
  SHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'ई-लर्निंग ऐप';

  @override
  String welcome(Object name) {
    return 'स्वागत है $name';
  }

  @override
  String get navHome => 'होम';

  @override
  String get navCourses => 'मेरे पाठ्यक्रम';

  @override
  String get navQuizzes => 'प्रश्नोत्तरी';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String get welcomeBack => 'वापसी पर स्वागत है';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get categories => 'श्रेणियाँ';

  @override
  String courses(Object count) {
    return '$count पाठ्यक्रम';
  }

  @override
  String get searchCourses => 'पाठ्यक्रम खोजें...';

  @override
  String get inProgress => 'प्रगति में';

  @override
  String progressPercent(Object percent) {
    return 'प्रगति: $percent%';
  }

  @override
  String get proLabel => 'प्रो';

  @override
  String get recommended => 'सिफ़ारिश की गई';

  @override
  String get seeAll => 'सभी देखें';

  @override
  String get noCoursesAvailable => 'कोई पाठ्यक्रम उपलब्ध नहीं';

  @override
  String get unknownInstructor => 'अज्ञात प्रशिक्षक';

  @override
  String error(Object message) {
    return 'त्रुटि: $message';
  }

  @override
  String get recommendedCourses => 'सिफ़ारिश किए गए पाठ्यक्रम';
}
