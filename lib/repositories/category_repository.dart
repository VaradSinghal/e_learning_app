import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/models/category.dart';
import 'package:flutter/cupertino.dart';

class CategoryRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Category>> getCategories() async {
    try {
      final categoriesSnapshot =
          await _firestore.collection('categories').get();

      final coursesSnapshot = await _firestore.collection('courses').get();

      final Map<String, int> courseCounts = {};

      for (var course in coursesSnapshot.docs) {
        final categoryId = course.data()['categoryId'] as String?;

        if (categoryId != null) {
          courseCounts[categoryId] = (courseCounts[categoryId] ?? 0) + 1;
        }
      }

      return categoriesSnapshot.docs.map((doc) {
        final data = doc.data();
        return Category(
          id: doc.id,
          name: data['name'] as String,
          icon: IconData(
            int.parse(data['icon'] as String),
            fontFamily: 'MaterialIcons',
          ),
          courseCount: courseCounts[doc.id] ?? 0,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
