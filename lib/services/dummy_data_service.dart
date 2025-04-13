import 'package:e_learning_app/models/chat_message.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:e_learning_app/models/lesson.dart';
import 'package:e_learning_app/models/question.dart';
import 'package:e_learning_app/models/quiz.dart';
import 'package:e_learning_app/models/quiz_attempt.dart';

class DummyDataService {
  static final List<Course> courses = [
    Course(
      id: '1',
      title: 'Flutter Development Bootcamp',
      description:
          'Learn Flutter and Dart to build iOS and Android apps from scratch.',
      imageUrl: 'https://i.ytimg.com/vi/z9kOcyk5t8s/maxresdefault.jpg',
      instructorId: 'inst_1',
      categoryId: '1',
      price: 99.99,
      lessons: _createFlutterLessons(),
      level: 'Intermediate',
      requirements: ['Basic programming knowledge', 'Dedication to Learn'],
      whatYouWillLearn: [
        'Flutter Basics',
        'State Management',
        'Networking',
        'Firebase Integration',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 245,
      enrollmentCount: 1200,
    ),

    Course(
      id: '2',
      title: 'UI/UX Design Masterclass',
      description:
          'Learn professional UI/UX design from scratch using Figma and Adobe XD.',
      imageUrl:
          'https://img.freepik.com/premium-psd/school-education-admission-youtube-thumbnail-web-banner-template_123829-103.jpg',
      instructorId: 'inst_2',
      categoryId: '2',
      price: 79.99,
      lessons: _createDesignLessons(),
      level: 'Beginner',
      requirements: [
        'No Prior experience needed',
        'Figma Free Account',
        'Creative Mindset',
      ],
      whatYouWillLearn: [
        'Design Principles',
        'Figma Basics',
        'Prototyping',
        'Design Systems',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
      updatedAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 180,
      enrollmentCount: 890,
      isPremium: true,
    ),

    Course(
      id: '3',
      title: 'Digital Marketing Essentials',
      description:
          'Master digital marketing strategies to grow your business online.',
      imageUrl:
          'https://img.freepik.com/free-vector/online-english-lessons-youtube-thumbnail_23-2149291956.jpg',
      instructorId: 'inst_3',
      categoryId: '3',
      price: 89.99,
      lessons: _createMarketingLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic understanding of marketing concepts',
        'Willingness to learn and adapt',
        'Social Media Familiarity',
      ],
      whatYouWillLearn: [
        'SEO Basics',
        'Social Media Marketing',
        'Email Marketing',
        'Content Marketing',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 156,
      enrollmentCount: 750,
    ),

    Course(
      id: '4',
      title: 'Advanced Mobile App Architecture',
      description:
          'Learn advanced architectural patterns and best practices for mobile app development',
      imageUrl:
          'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149024129.jpg',
      instructorId: 'inst_4',
      categoryId: '1',
      price: 129.99,
      lessons: _createArchitectureLessons(),
      level: 'Advanced',
      requirements: [
        'Intermediate Programming knowledge',
        'Basic mobile app development experience',
        'Familiarity with design patterns',
      ],
      whatYouWillLearn: [
        'Clean Architecture principles',
        'Dependency Injection',
        'MVVM and MVP patterns',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime.now(),
      rating: 4.9,
      reviewCount: 178,
      enrollmentCount: 560,
    ),
    Course(
      id: '5',
      title: 'Motion Design with After Effects',
      description:
          'Create stunning motion graphics and visual effects using Adobe After Effects',
      instructorId: 'inst_5',
      categoryId: '2',
      imageUrl:
          'https://img.freepik.com/free-vector/flat-design-motion-graphics-background_23-2149489315.jpg',
      price: 89.99,
      lessons: _createMotionDesignLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic Adobe After effects knowledge',
        'Creative mindset',
        'Willingness to learn',
      ],
      whatYouWillLearn: [
        'Motion Graphics Basics',
        'Keyframe Animation',
        'Visual Effects',
        'Compositing Techniques',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 200,
      enrollmentCount: 800,
      isPremium: true,
    ),

    Course(
      id: '6',
      title: 'Financial Management Fundamentals',
      description:
          'Master the basics of financial management and buisness economics.',
      imageUrl:
          'https://img.freepik.com/free-vector/gradient-stock-market-concept_23-2149166910.jpg',
      instructorId: 'inst_6',
      categoryId: '3',
      price: 74.99,
      lessons: _createFinanceLessons(),
      level: 'Beginner',
      requirements: ['Basic math skills', 'Interest in finance'],
      whatYouWillLearn: [
        'Financial Statements',
        'Investment Basics',
        'Budgeting',
        'Risk Management',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
      updatedAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 98,
      enrollmentCount: 340,
    ),

    Course(
      id: '7',
      title: 'Professional Photography Masterclass',
      description:
          'Learn professional photography techniques from composition to post-processing.',
      imageUrl:
          'https://img.freepik.com/free-photo/professional-camera-blurred-background_169016-10249.jpg',
      instructorId: 'inst_7',
      categoryId: '5',
      price: 84.99,
      lessons: _createPhotographyLessons(),
      level: 'Beginner',
      requirements: [
        'Digital camera (DSLR or mirrorless)',
        'Basic understanding of photography concepts',
        'Willingness to learn and practice',
      ],
      whatYouWillLearn: [
        'Camera Settings',
        'Composition Techniques',
        'Lighting Fundamentals',
        'Post-Processing Basics',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 132,
      enrollmentCount: 350,
      isPremium: true,
    ),
    Course(
      id: '8',
      title: 'English Business Communication',
      description: 'Master business English for professional sucess.',
      imageUrl:
          'https://img.freepik.com/free-vector/language-learning-concept-illustration_114360-6565.jpg',
      instructorId: 'inst_8',
      categoryId: '6',
      price: 69.99,
      lessons: _createLanguageLessons(),
      level: 'Intermediate',
      requirements: ['Basic English knowledge', 'Willingness to learn'],
      whatYouWillLearn: [
        'Business Vocabulary',
        'Effective Communication',
        'Presentation Skills',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 18)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 167,
      enrollmentCount: 580,
    ),
  ];

  static final List<Quiz> quizzes = [
    Quiz(
      id: '1',
      title: 'Flutter Basic Quiz',
      description: 'Test your knowledge of Flutter fundamentals',
      timeLimit: 30,
      questions: _createFlutterQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      isActive: true,
    ),

    Quiz(
      id: '2',
      title: 'Dart Programming Quiz',
      description: 'Test your knowledge of Dart programming language',
      timeLimit: 25,
      questions: _createDartQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isActive: true,
    ),

    Quiz(
      id: '3',
      title: 'State Management Quiz',
      description: 'Test your knowledge of Flutter State Management',
      timeLimit: 20,
      questions: _createStateManagementQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isActive: true,
    ),
  ];

  static final List<QuizAttempt> quizAttempts = [];

  static List<Lesson> _createFlutterLessons() {
    return [
      Lesson(
        id: '1',
        title: 'Introduction to Flutter',
        description:
            'This is a detailed description for Introduction to Flutter.',
        videoUrl:
            'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        duration: 30,
        resources: _createDummyResources(),
        isPreview: true,
        isLocked: false,
      ),
      _createLesson('2', 'Dart Programming Basics', false, false),
      _createLesson('3', 'Building UI with Widgets', false, false),
      _createLesson('4', 'State Management', false, false),
      _createLesson('5', 'Working with APIs', false, false),
      _createLesson('6', 'Local Data Storage', false, false),
    ];
  }

  static List<Lesson> _createDesignLessons() {
    return [
      _createLesson('1', 'Design Fundamentals', true, false),
      _createLesson('2', 'Color Theory', false, false),
      _createLesson('3', 'Typography Basics', false, false),
      _createLesson('4', 'Layout Design', false, false),
      _createLesson('5', 'Prototyping', false, false),
    ];
  }

  static List<Lesson> _createMarketingLessons() {
    return [
      _createLesson('1', 'Digital Marketing Overview', true, true),
      _createLesson('2', 'SEO Basics', false, false),
      _createLesson('3', 'Social Media Marketing', false, false),
      _createLesson('4', 'Email Marketing Strategies', false, false),
      _createLesson('5', 'Analytics and Reporting', false, false),
    ];
  }

  static List<Lesson> _createArchitectureLessons() {
    return [
      _createLesson('1', 'Clean Architecture Overview', true, true),
      _createLesson('2', 'SOLID Principles', false, true),
      _createLesson('3', 'Repository Pattern', false, true),
      _createLesson('4', 'Dependency Injection', false, false),
      _createLesson('5', 'Unit Testing ', false, false),
    ];
  }

  static List<Lesson> _createMotionDesignLessons() {
    return [
      _createLesson('1', 'Animation Basics', true, false),
      _createLesson('2', 'Keyframe Animation', false, false),
      _createLesson('3', 'Character Ringing', false, false),
      _createLesson('4', 'Visual Effects', false, false),
      _createLesson('5', 'Rendering and Exporting', false, false),
    ];
  }

  static List<Lesson> _createFinanceLessons() {
    return [
      _createLesson('1', 'Introduction to Finance', true, false),
      _createLesson('2', 'Financial Statements', false, false),
      _createLesson('3', 'Investment Basics', false, false),
      _createLesson('4', 'Risk Management', false, false),
      _createLesson('5', 'Business Valuation', false, false),
    ];
  }

  static List<Lesson> _createPhotographyLessons() {
    return [
      _createLesson('1', 'Understanding Your Camera', true, false),
      _createLesson('2', 'Composition Techniques', false, false),
      _createLesson('3', 'Lighting Fundamentals', false, false),
      _createLesson('4', 'Potrait Photography', false, false),
      _createLesson('5', 'Post-Processing Basics', false, false),
    ];
  }

  static List<Lesson> _createLanguageLessons() {
    return [
      _createLesson('1', 'Business Vocabulary', true, false),
      _createLesson('2', 'Email Writing', false, false),
      _createLesson('3', 'Presentation Skills', false, false),
      _createLesson('4', 'Negotiation Techniques', false, false),
      _createLesson('5', 'Professional Communication', false, false),
    ];
  }

  static Lesson _createLesson(
    String id,
    String title,
    bool isPreview,
    bool isCompleted,
  ) {
    return Lesson(
      id: 'lesson_$id',
      title: title,
      description: 'This is a detailed description for $title.',
      videoUrl:
          'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      duration: 30,
      resources: _createDummyResources(),
      isPreview: isPreview,
      isLocked: !isPreview,
      isCompleted: isCompleted,
    );
  }

  static List<Resource> _createDummyResources() {
    return [
      Resource(
        id: 'res_1',
        title: 'Lesson Slides',
        type: 'pdf',
        url: 'https://example.com/slides.pdf',
      ),
      Resource(
        id: 'res_2',
        title: 'Exercise Files',
        type: 'zip',
        url: 'https://example.com/exercises.zip',
      ),
    ];
  }

  static Course getCourseById(String id) {
    return courses.firstWhere(
      (course) => course.id == id,
      orElse: () => courses.first,
    );
  }

  static List<Course> getCoursesByCategory(String categoryId) {
    return courses.where((course) => course.categoryId == categoryId).toList();
  }

  static List<Course> getInstructorCourses(String instructorId) {
    return courses
        .where((course) => course.instructorId == instructorId)
        .toList();
  }

  static bool isCourseCompleted(String courseId) {
    final course = getCourseById(courseId);
    return course.lessons.every((lesson) => lesson.isCompleted);
  }

  static List<Question> _createFlutterQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is Flutter',
        correctOptionId: 'a',
        options: [
          Option(
            id: 'a',
            text: 'A UI toolkit for building natively compiled apps',
          ),
          Option(id: 'b', text: 'A programming language'),
          Option(id: 'c', text: 'A database management system'),
          Option(id: 'd', text: 'A web framework'),
        ],
        points: 1,
      ),
      Question(
        id: '2',
        text: 'Which language is used for Flutter development?',
        correctOptionId: 'a',
        options: [
          Option(id: 'a', text: 'Dart'),
          Option(id: 'b', text: 'JavaScript'),
          Option(id: 'c', text: 'Python'),
          Option(id: 'd', text: 'Java'),
        ],
        points: 1,
      ),
    ];
  }

  static List<Question> _createDartQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is Dart?',
        correctOptionId: 'a',
        options: [
          Option(id: 'a', text: 'A object-oriented programming language'),
          Option(id: 'b', text: 'A database management system'),
          Option(id: 'c', text: 'A web framework'),
          Option(id: 'd', text: 'A UI toolkit'),
        ],
        points: 1,
      ),
      Question(
        id: '2',
        text: 'Which of the following is a Dart collection type?',
        correctOptionId: 'b',
        options: [
          Option(id: 'a', text: 'String'),
          Option(id: 'b', text: 'List'),
          Option(id: 'c', text: 'Integer'),
          Option(id: 'd', text: 'Boolean'),
        ],
        points: 1,
      ),
    ];
  }

  static List<Question> _createStateManagementQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is state management in Flutter?',
        correctOptionId: 'a',
        options: [
          Option(id: 'a', text: 'Managing the state of the app'),
          Option(id: 'b', text: 'Managing the UI layout'),
          Option(id: 'c', text: 'Managing the database'),
          Option(id: 'd', text: 'Managing network requests'),
        ],
        points: 1,
      ),
      Question(
        id: '2',
        text:
            'Which of the following is a state management solution in Flutter?',
        correctOptionId: 'b',
        options: [
          Option(id: 'a', text: 'Flutter SDK'),
          Option(id: 'b', text: 'Provider'),
          Option(id: 'c', text: 'Flutter Web'),
          Option(id: 'd', text: 'Flutter CLI'),
        ],
        points: 1,
      ),
    ];
  }

  static Quiz getQuizById(String id) {
    return quizzes.firstWhere(
      (quiz) => quiz.id == id,
      orElse: () => quizzes.first,
    );
  }

  static void saveQuizAttempt(QuizAttempt attempt) {
    quizAttempts.add(attempt);
  }

  static List<QuizAttempt> getQuizAttempts(String userId) {
    return quizAttempts.where((attempt) => attempt.userId == userId).toList();
  }

  static final Set<String> _purchasedCourseIds = {};

  static bool isCourseUnlocked(String courseId) {
    final course = getCourseById(courseId);
    return !course.isPremium || _purchasedCourseIds.contains(courseId);
  }

  static void addPurchasedCourse(String courseId) {
    _purchasedCourseIds.add(courseId);
  }

  static final Map<String, TeacherStats> teacherStats = {
    'inst_1': TeacherStats(
      totalStudents: 1234,
      activeCourses: 8,
      totalRevenue: 12345.67,
      averageRating: 4.8,
      monthlyEnrollments: [156, 189, 234, 278, 312, 289],
      monthlyRevenue: [1234, 1567, 1890, 2100, 2345, 2189],
      studentEngagement: StudentEngagement(
        averageCompletionRate: 0.78,
        averageTimePerLesson: 45,
        activeStudentsThisWeek: 156,
        courseCompletionRates: {
          'Flutter Development Bootcamp': 0.85,
          'Advanced Flutter': 0.72,
          'Flutter State Management': 0.65,
        },
      ),
    ),
  };

  static final Map<String, List<StudentProgress>> studentProgress = {
    'inst_1': [
      StudentProgress(
        studentId: 'student_1',
        studentName: 'John Smith',
        courseId: '1',
        courseName: 'Flutter Development Bootcamp',
        progress: 0.75,
        lastActive: DateTime.now().subtract(const Duration(hours: 2)),
        quizScores: [85, 92, 78, 88],
        completedLessons: 12,
        totalLessons: 16,
        averageTimePerLesson: 45,
      ),
      StudentProgress(
        studentId: 'student_2',
        studentName: 'Emma Wilson',
        courseId: '1',
        courseName: 'Flutter Development Bootcamp',
        progress: 0.60,
        lastActive: DateTime.now().subtract(const Duration(days: 1)),
        quizScores: [95, 82, 88],
        completedLessons: 9,
        totalLessons: 16,
        averageTimePerLesson: 38,
      ),
    ],
  };

  static TeacherStats getTeacherStats(String instructorId) {
    final instructorCourses = getInstructorCourses(instructorId);
    final stats = teacherStats[instructorId] ?? TeacherStats.empty();

    return TeacherStats(
      totalStudents: instructorCourses.fold(
        0,
        (sum, course) => sum + course.enrollmentCount,
      ),
      activeCourses: instructorCourses.length,
      totalRevenue: instructorCourses.fold(
        0.0,
        (sum, course) => sum + (course.price * course.enrollmentCount),
      ),
      averageRating:
          instructorCourses.isEmpty
              ? 0.0
              : instructorCourses.fold(
                    0.0,
                    (sum, course) => sum + course.rating,
                  ) /
                  instructorCourses.length,
      monthlyEnrollments: stats.monthlyEnrollments,
      monthlyRevenue: stats.monthlyRevenue,
      studentEngagement: stats.studentEngagement,
    );
  }

  static List<StudentProgress> getStudentProgress(String instructorId) {
    final instructorCourses = getInstructorCourses(instructorId);
    final courseIds = instructorCourses.map((c) => c.id).toSet();

    return studentProgress[instructorId]
            ?.where((progress) => courseIds.contains(progress.courseId))
            .toList() ??
        [];
  }

  static Stream<List<ChatMessage>> getChatMessages(String courseId) {
    return Stream.value(
      _dummyChats.values
          .expand((messages) => messages)
          .where((msg) => msg.courseId == courseId)
          .toList(),
    );
  }

  static Stream<List<ChatMessage>> getTeacherChats(String instructorId) {
    return Stream.value(_dummyChats[instructorId] ?? []);
  }

  static Map<String, List<ChatMessage>> getTeacherChatsByCourse(
    String instructorId,
  ) {
    final Map<String, List<ChatMessage>> chatsByCourse = {};
    final messages = _dummyChats[instructorId] ?? [];

    for (var message in messages) {
      if (!chatsByCourse.containsKey(message.courseId)) {
        chatsByCourse[message.courseId] = [];
      }
      chatsByCourse[message.courseId]!.add(message);
    }
    return chatsByCourse;
  }

  static final Map<String, List<ChatMessage>> _dummyChats = {
    'inst_1': [
      ChatMessage(
        id: '1',
        senderId: 'student_1',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'Hi, I have a question about state management',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),

      ChatMessage(
        id: '2',
        senderId: 'student_2',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'When is next live session',
        timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
      ChatMessage(
        id: '3',
        senderId: 'student_3',
        receiverId: 'inst_1',
        courseId: '2',
        message: 'Could you review my latest design project?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
    ],
  };

  static void updateLessonStatus(
    String courseId,
    String lessonId, {
    bool? isCompleted,
    bool? isLocked,
  }) {
    final courseIndex = courses.indexWhere((c) => c.id == courseId);
    if (courseIndex != -1) {
      final course = courses[courseIndex];
      final lessonIndex = course.lessons.indexWhere((l) => l.id == lessonId);

      if (lessonIndex != -1) {
        var updatedLesson = course.lessons[lessonIndex].copyWith(
          isCompleted: isCompleted ?? course.lessons[lessonIndex].isCompleted,
          isLocked: isLocked ?? course.lessons[lessonIndex].isLocked,
        );
        courses[courseIndex].lessons[lessonIndex] = updatedLesson;
      }
    }
  }

  static bool isLessonCompleted(String courseId, String lessonId) {
    final course = getCourseById(courseId);
    return course.lessons
        .firstWhere(
          (l) => l.id == lessonId,
          orElse:
              () => Lesson(
                id: '',
                title: '',
                description: '',
                videoUrl: '',
                duration: 0,
                resources: [],
              ),
        )
        .isCompleted;
  }
}

class TeacherStats {
  final int totalStudents;
  final int activeCourses;
  final double totalRevenue;
  final double averageRating;
  final List<int> monthlyEnrollments;
  final List<double> monthlyRevenue;
  final StudentEngagement studentEngagement;

  TeacherStats({
    required this.totalStudents,
    required this.activeCourses,
    required this.totalRevenue,
    required this.averageRating,
    required this.monthlyEnrollments,
    required this.monthlyRevenue,
    required this.studentEngagement,
  });

  factory TeacherStats.empty() => TeacherStats(
    totalStudents: 0,
    activeCourses: 0,
    totalRevenue: 0,
    averageRating: 0,
    monthlyEnrollments: [],
    monthlyRevenue: [],
    studentEngagement: StudentEngagement.empty(),
  );
}

class StudentEngagement {
  final double averageCompletionRate;
  final int averageTimePerLesson;
  final int activeStudentsThisWeek;
  final Map<String, double> courseCompletionRates;

  StudentEngagement({
    required this.averageCompletionRate,
    required this.averageTimePerLesson,
    required this.activeStudentsThisWeek,
    required this.courseCompletionRates,
  });

  factory StudentEngagement.empty() => StudentEngagement(
    averageCompletionRate: 0,
    averageTimePerLesson: 0,
    activeStudentsThisWeek: 0,
    courseCompletionRates: {},
  );
}

class StudentProgress {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final double progress;
  final DateTime lastActive;
  final List<int> quizScores;
  final int completedLessons;
  final int totalLessons;
  final int averageTimePerLesson;

  double get averageScore {
    if (quizScores.isEmpty) return 0.0;
    return quizScores.reduce((a, b) => a + b) / quizScores.length / 100;
  }

   StudentProgress({required this.studentId, required this.studentName, required this.courseId, required this.courseName, required this.progress, required this.lastActive, required this.quizScores, required this.completedLessons, required this.totalLessons, required this.averageTimePerLesson});
  
}
