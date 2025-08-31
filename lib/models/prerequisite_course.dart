class PrerequisiteCourse {
  final String id;
  final String title;

  PrerequisiteCourse({required this.id, required this.title});

  factory PrerequisiteCourse.fromJson(Map<String, dynamic> json) {
    return PrerequisiteCourse(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}